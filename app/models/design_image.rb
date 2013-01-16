#encoding:utf-8

class DesignImage < ActiveRecord::Base
  attr_accessible :imageable_id, :imageable_type, :file

  belongs_to :imageable, :polymorphic => true
  has_one :event_attendee
  belongs_to :user
  belongs_to :last_user, class_name: 'User', primary_key: 'id'

  # validate :file_dimensions, :unless => "errors.any?"

  scope :available, where("design_images.imageable_id is not null and design_images.imageable_type is not null and design_images.imageable_type <> 'Inspiration'").order("design_images.id, design_images.created_at")

  has_attached_file :file,
    :styles => {:thumb => "60x45#", :index => "291x315#", :list => "188x214#",
        :inside => "188>", :outside => "202>", :home_page => "90>",
        :slide => "900>", :slide_thumb => "205x138#",
        :fullscreen => "980x655>", :fullscreen_thumb => "100x120#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

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
        DesignImage.available.where(title: name)
      when 'username'
        DesignImage.joins(:user).available.where(["users.username = ?", keyword])
      when 'yes_update'
        DesignImage.available.where("last_updated_at is not null")
      when 'no_update'
        DesignImage.available.where("last_updated_at is null")
      when 'id'
        DesignImage.available.where(id: keyword)
      when 'imageable_type'
        if keyword == '推荐作品'
          DesignImage.available.where(imageable_type: 'Design')
        elsif keyword == '色彩配搭'
          DesignImage.available.where(imageable_type: 'ColorDesign')
        elsif keyword == '大师作品'
          DesignImage.available.where(imageable_type: 'MasterDesign')
        end
      when 'last_user_id'
        last_user_id = User.select("id").where(username: keyword).first
        DesignImage.available.where(["design_images.last_user_id = ?", last_user_id])
    end
  end
end