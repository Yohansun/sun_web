#encoding: utf-8
class ImageTag < ActiveRecord::Base
  attr_accessible :design_image_id, :image_library_category_id, :genre
  belongs_to :design_image
  belongs_to :image_library_category
  scope :existed, lambda { |image_id, cid| where(["design_image_id = ? and image_library_category_id = ?", image_id, cid]) unless image_id.nil? && cid.nil? }
  belongs_to :image_library_category
  validates :image_library_category_id,:design_image_id,:presence => true
  validate :unique_design_image_with_image_library_category
  
  
  private
  def unique_design_image_with_image_library_category
    errors[:base] << "作品设计类型重复" if ImageTag.exists?(:design_image_id => design_image_id,:image_library_category_id => image_library_category_id)
  end
end
