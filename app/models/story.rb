class Story < ActiveRecord::Base
  attr_accessible :title, :content, :area_id, :user_id, :property_name, :parent_id

  has_many :story_images, :dependent => :destroy
  has_many :votes, :as => :voteable
  has_many :collects, :dependent => :destroy
  belongs_to :area
  belongs_to :user

  def cover_img
  	self.story_images.where(is_cover: 1).try(:first)
  end

  def location
    if self.area_id
      area = Area.find(area_id)
      if area.parent.name == area.parent.parent.name
        area.parent.name + " " + area.name
      else
        area.parent.parent.name + " " + area.parent.name + " " + area.name
      end
    end 
  end
end
