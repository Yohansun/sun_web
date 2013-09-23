#encoding: utf-8
class ParentTag < ActiveRecord::Base
  attr_accessible :design_image_id, :image_library_category_id
  belongs_to :design_image
  belongs_to :image_library_category

  validates :image_library_category_id,:design_image_id,:presence => true
  validate :unique_design_image_with_image_library_category

  private
  def unique_design_image_with_image_library_category
    errors[:base] << "标签类型重复" if ParentTag.exists?(:design_image_id => design_image_id,:image_library_category_id => image_library_category_id)
  end
end
