#encoding:utf-8

require 'ruby-pinyin'

class DesignImage < ActiveRecord::Base
  attr_accessible :imageable_id, :imageable_type, :file, :title, :color1, :color2, :color3, :color1_name, :color2_name, :color3_name, :tags, :area_id, :last_user_id, :last_updated_at, :view_count, :sorts

  belongs_to :imageable, :polymorphic => true
  has_one :event_attendee
  has_many :tags, class_name: 'ImageTag',:dependent => :destroy
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable
  belongs_to :user
  belongs_to :area
  has_many :collects, :dependent => :destroy
  belongs_to :last_user, class_name: 'Admin', primary_key: 'id'
  belongs_to :design, :polymorphic => true,foreign_type: "imageable_type", foreign_key: 'imageable_id'

  #所有标签
  has_many :all_tags    ,:through => :tags,:source => :image_library_category
  #图片风格
  has_many :image_styles,:through => :tags,:source => :image_library_category,:conditions => {:parent_id => 34}
  
  #应用在channel_controller#access中
  scope :users,joins(:user).select("count(design_images.user_id) as ucount,design_images.id,design_images.user_id,design_images.created_at,design_images.file_file_name,design_images.file_updated_at").group(:user_id).order("design_images.created_at desc")

  # validate :file_dimensions, :unless => "errors.any?"

  scope :available, where("design_images.imageable_id is not null and design_images.imageable_type is not null and design_images.imageable_type <> 'Inspiration' and design_images.user_id is not null")

  scope :audited_with_colors, where(["edited_color = ? and audited = ?", true, true])

  scope :up_down_image, lambda{ |current_id| unscoped.where("id IN (select max(id) from design_images where id < #{current_id} union select min(id) from design_images where id > #{current_id})").order('id')}

  scope :from, where("created_at > (?)", "2013-3-1")
  

  has_attached_file :file,
    :styles => {:thumb => "60x45#", :index => "291x315#", :list => "188x214#",
        :inside => "188>", :outside => "202>", :home_page => "90>",
        :home_design_image1 => "380x365#", :home_design_image2 => "380x170#", :home_design_image3 => "180x170#",
        :design_image_big => "686x496>", :design_image_list => "224x162#",
        :mobile_design_image_big => "320x206#",
        :mobile_design_image_list => "140x178#",
        :mobile_fullscreen => "320x320#",
        :mobile_index => "140x178#",
        :mobile_list => "220x100#",
        :mobile_slide => "320x206#",
        :design_work_slide =>"680x353>",
        :slide => "900>",
        :slide_thumb => "205x138#",
        :fullscreen => "980x655>", :fullscreen_thumb => "100x120#", :spring_img => "373x261#", :spring => "269x275#", :img_lib_tag => "237x177#",
        :grid_list => "204x145>"},
    :convert_options => {
      :slide => " #{Rails.root}/public/system/watermark/icolor.png -gravity southeast -geometry +5+10 -composite ",
      :design_image_big => " #{Rails.root}/public/system/watermark/icolor.png -gravity southeast -geometry +5+10 -composite ",
      :original => " #{Rails.root}/public/system/watermark/icolor.png -gravity southeast -geometry +5+10 -composite "
      },
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
    

    delegate :id,:to => :design, :allow_nil => true ,:prefix => true

  # validates_presence_of :area_id

  before_save :set_pinyin
  before_save :set_sort

  def set_pinyin
    if self.title_changed?
      set_pinyin!
    end
  end

  # 科普兰德(1)-每周之星(2 后台设置)-大师作品(3)-sina(4)-色彩搭配(5)-自行上传(100)
  def set_sort
    self.sorts = 100 if self.sorts.blank?
    self.sorts = 1 if source == 'kepulande'
    self.sorts = 3 if self.imageable_type == 'MasterDesign'
    self.sorts = 4 if source == 'sina'
    self.sorts = 5 if self.imageable_type == 'ColorDesign'
  end

  def set_pinyin!
    self.pinyin = PinYin.of_string(self.title.to_s[0]).first.to_s
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

  def self.search_with(genre, keyword, start_date, end_date)
    case genre
      when 'yes_color'
        DesignImage.available.where("(color1 is not null or color2 is not null or color3 is not null) and edited_color is false")
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
        elsif keyword == '色彩搭配'
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
      when 'imageable_id'
        DesignImage.available.where("design_images.imageable_id = ? and design_images.imageable_type = ?", keyword, 'MasterDesign').order("design_images.id DESC")
      when 'no_audited'
        DesignImage.available.where("no_audited is true").order("design_images.id DESC")
      when 'pub_time'
        DesignImage.available.where(:created_at => (start_date.to_time)..(end_date.to_time + 1.day)).order("design_images.id DESC")
      when 'al_time'
        DesignImage.available.where(:updated_at => (start_date.to_time)..(end_date.to_time + 1.day)).order("design_images.id DESC")
      when 'pub_date'
        DesignImage.available.where("(created_at >= :start_date AND created_at <= :end_date) AND (design_images.imageable_type = 'MasterDesign')",{:start_date => start_date.to_time, :end_date => end_date.to_time + 1.day}).order("design_images.id DESC")
      when 'al_date'
        DesignImage.available.where("(updated_at >= :start_date AND updated_at <= :end_date) AND (design_images.imageable_type = 'MasterDesign')",{:start_date => start_date.to_time, :end_date => end_date.to_time + 1.day}).order("design_images.id DESC")
    end
  end


  def sha_prefix(string)
    Digest::SHA1.hexdigest("#{string}#{rand}")[0..6]
  end

  def self.search_tags(tag_ids, use_in_query = false)
    return joins(:tags).where("image_tags.image_library_category_id in (?)", tag_ids) if use_in_query
    joins = []
    tag_ids.each do |tag_id|
      taggings_alias = "taggings_#{tag_id}"

      tagging_join  = "JOIN image_tags #{taggings_alias}" +
      " ON #{taggings_alias}.design_image_id = design_images.id" +
      " AND #{taggings_alias}.image_library_category_id = #{tag_id}"

      joins << tagging_join
    end

    scoped(:joins => joins.join(" "))
  end
end
