# encoding: utf-8
class StoryImage < ActiveRecord::Base
  attr_accessible :is_cover, :user_id, :story_id, :file

  belongs_to :story
  has_many :tags, class_name: 'StoryImageTag',:dependent => :destroy
  has_many :story_styles, :through => :tags,:source => :image_library_category,:conditions => {:parent_id => 34}
  has_many :house_type, :through => :tags,:source => :image_library_category,:conditions => {:parent_id => 1}
  has_many :acreages, :through => :tags,:source => :image_library_category,:conditions => {:parent_id => 28}
  has_many :spaces, :through => :tags,:source => :image_library_category,:conditions => {:parent_id => 82}

  has_attached_file :file,
    :styles => {:slide => "680x353>",:list =>"203x146#", :baicheng_list => "201x145>", :baicheng_slide => "670x353>", :spring_img=>"373x261#", :thumb=>"83x58#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  def story_style_names  
    story_styles.map(&:title).join(',')
  end

  def house_type_names  
    house_type.map(&:title).join(',')
  end

  def acreages_names  
    acreages.map(&:title).join(',')
  end

  def spaces_names  
    spaces.map(&:title).join(',')
  end

  def self.so_user(keyword)
  	StoryImage.joins(:story => :user).where("users.username=?", keyword)
  end
  def self.so_design(keyword)
  	StoryImage.joins(:story).where("stories.title=?", keyword)
  end
  def self.so_area(keyword)
    StoryImage.joins(:story => :area).where("areas.id=?", keyword)
  end
end

