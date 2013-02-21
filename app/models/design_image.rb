#encoding:utf-8

require 'ruby-pinyin'

class DesignImage < ActiveRecord::Base
  attr_accessible :imageable_id, :imageable_type, :file, :title, :color1, :color2, :color3, :color1_name, :color2_name, :color3_name, :tags, :area_id, :last_user_id, :last_updated_at, :view_count

  belongs_to :imageable, :polymorphic => true
  has_one :event_attendee
  has_many :tags, class_name: 'ImageTag'
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable
  belongs_to :user
  belongs_to :area
  has_many :collects
  belongs_to :last_user, class_name: 'Admin', primary_key: 'id'
  belongs_to :design, class_name: 'Design', :foreign_key => 'imageable_id'
  # validate :file_dimensions, :unless => "errors.any?"

  scope :available, where("design_images.imageable_id is not null and design_images.imageable_type is not null and design_images.imageable_type <> 'Inspiration' and design_images.user_id is not null")

  scope :up_down_image, lambda{ |current_id| unscoped.where("id IN (select max(id) from design_images where id < #{current_id} union select min(id) from design_images where id > #{current_id})").order('id')}

  has_attached_file :file,
    :styles => {:thumb => "60x45#", :index => "291x315#", :list => "188x214#",
        :inside => "188>", :outside => "202>", :home_page => "90>",
        :home_design_image1 => "380x365#", :home_design_image2 => "380x170#", :home_design_image3 => "180x170#",
        :design_image_big => "686x496#", :design_image_list => "224x162#",
        :slide => "900>", :slide_thumb => "205x138#",
        :fullscreen => "980x655>", :fullscreen_thumb => "100x120#", :spring_img => "373x261#", :spring => "269x275#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  # validates_presence_of :area_id

  before_save :set_pinyin

  def set_pinyin
    if self.title_changed?
      set_pinyin!
    end
  end

  def set_pinyin!
    self.pinyin = PinYin.of_string(self.title[0]).first.to_s
  end

  def comments_count
    self.comments.size
  end

  def areas
    if self.area_id
      self.area.self_and_ancestors.map(&:id)
    else
      []
    end
  end

  def file_dimensions
    dimensions = Paperclip::Geometry.from_file(self.file.to_file(:original))
    if dimensions.width < 202
       errors.add(:file, '图片宽度必须大于202像素！')
    end
  end

  def channel_name
    case self.imageable_type
    when 'Design' then "推荐作品"
    when 'ColorDesign' then "色彩配搭"
    when 'MasterDesign' then "大师作品"
    end
  end

  def image_come_from
    case self.imageable_type
    when 'Inspiration' then '灵感秀上传'
    when 'Design' then '设计师上传'
    when 'ColorDesign' then "色彩配搭"
    when 'MasterDesign' then "大师作品"
    else
      return 'icolor上传'
    end
  end

  def self.search(genre, keyword)
    case genre
      when 'title'
        DesignImage.available.where(title: keyword).order("design_images.id DESC")
      when 'username'
        DesignImage.joins(:user).available.where(["users.username = ?", keyword]).order("design_images.id DESC")
      when 'yes_update'
        DesignImage.available.where("last_updated_at is not null").order("design_images.id DESC")
      when 'no_update'
        DesignImage.available.where("last_updated_at is null").order("design_images.id DESC")
      when 'id'
        DesignImage.available.where(id: keyword).order("design_images.id DESC")
      when 'imageable_type'
        if keyword == '推荐作品'
          DesignImage.available.where(imageable_type: 'Design').order("design_images.id DESC")
        elsif keyword == '色彩配搭'
          DesignImage.available.where(imageable_type: 'ColorDesign').order("design_images.id DESC")
        elsif keyword == '大师作品'
          DesignImage.available.where(imageable_type: 'MasterDesign').order("design_images.id DESC")
        end
      when 'last_user_id'
        DesignImage.includes(:last_user).available.where(["admins.username = ?", keyword]).order("design_images.id DESC")
      when 'edit_no_verify'
        DesignImage.includes(:tags).available.where("(color1 is not null or color2 is not null or color3 is not null) and (title is not null or reason is not null or content is not null) and audited is false and image_tags.design_image_id is not null")
      when 'color_no_edit'
        DesignImage.includes(:tags).available.where("design_images.edited_color = ? and (design_images.audited is null or design_images.audited = ?)", true, false)
      when 'edit_no_color'
        DesignImage.includes(:tags).available.where("(design_images.edited_color = ? or design_images.edited_color is null) and design_images.audited = ?",false, true)
      when 'edit_color'
        DesignImage.available.where("design_images.edited_color = ? AND design_images.audited = ?", true, true).order("design_images.id DESC")
      when 'no_edit_color'
        DesignImage.available.where("(design_images.edited_color = ? or design_images.edited_color is null) AND (design_images.audited is null or design_images.audited = ?)", false, false).order("design_images.id DESC")
    end
  end


  def sha_prefix(string)
    Digest::SHA1.hexdigest("#{string}#{rand}")[0..6]
  end

  def self.search_tags(tag_ids)
    joins(:tags).where("image_tags.image_library_category_id in (?)", tag_ids)

    # joins = []
    # tag_ids.each do |tag_id|
    #   taggings_alias = "taggings_#{tag_id}"

    #   tagging_join  = "JOIN image_tags #{taggings_alias}" +
    #   "  ON #{taggings_alias}.design_image_id = design_images.id" +
    #   " AND #{taggings_alias}.image_library_category_id = #{tag_id}"

    #   joins << tagging_join
    # end

    # scoped(:joins => joins.join(" "))
  end
end