#encoding: utf-8
class ImageTag < ActiveRecord::Base
  attr_accessible :design_image_id, :image_library_category_id, :genre
  belongs_to :design_image
  belongs_to :image_library_category
  scope :existed, lambda { |image_id, cid| where(["design_image_id = ? and image_library_category_id = ?", image_id, cid]) unless image_id.nil? && cid.nil? }
  validates :image_library_category_id,:design_image_id,:presence => true
  validate :unique_design_image_with_image_library_category

  after_save :save_parent_tags

  def save_parent_tags
    parent_id = self.image_library_category.parent_id
    self.design_image.parent_tags.create(design_image_id: design_image_id, image_library_category_id: parent_id)
  end

  private
  def unique_design_image_with_image_library_category
    errors[:base] << "作品设计类型重复" if ImageTag.exists?(:design_image_id => design_image_id,:image_library_category_id => image_library_category_id)
  end
end
