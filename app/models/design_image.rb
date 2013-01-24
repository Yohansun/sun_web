#encoding:utf-8

class DesignImage < ActiveRecord::Base
  attr_accessible :imageable_id, :imageable_type, :file, :title, :color1, :color2, :color3, :tags, :area_id, :last_user_id, :last_updated_at

  belongs_to :imageable, :polymorphic => true
  has_one :event_attendee
  has_many :tags, class_name: 'ImageTag'
  belongs_to :user
  belongs_to :area
  belongs_to :last_user, class_name: 'Admin', primary_key: 'id'
  belongs_to :design, class_name: 'Design', :foreign_key => 'imageable_id'
  # validate :file_dimensions, :unless => "errors.any?"

  scope :available, where("design_images.imageable_id is not null and design_images.imageable_type is not null and design_images.imageable_type <> 'Inspiration' and design_images.user_id is not null")

  scope :up_down_image, lambda{ |current_id| unscoped.where("id IN (select max(id) from design_images where id < #{current_id} union select min(id) from design_images where id > #{current_id})").order('id')}

  has_attached_file :file,
    :styles => {:thumb => "60x45#", :index => "291x315#", :list => "188x214#",
        :inside => "188>", :outside => "202>", :home_page => "90>",
        :slide => "900>", :slide_thumb => "205x138#",
        :fullscreen => "980x655>", :fullscreen_thumb => "100x120#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  # validates_presence_of :area_id

  def areas
    areas = []
    if self.area_id
      if self.area.children.any?
        areas.push(self.area.parent.id)
        areas.push(self.area.id)
        # areas.push(nil)
      else
        city = self.area.parent
        areas.push(city.parent.id)
        areas.push(city.id)
        areas.push(self.area.id)
      end
    end
    areas
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
    end
  end
end