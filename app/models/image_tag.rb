class ImageTag < ActiveRecord::Base
  attr_accessible :design_image_id, :image_library_category_id

  scope :existed, lambda { |image_id, cid| where(["design_image_id = ? and image_library_category_id = ?", image_id, cid]) unless image_id.nil? && cid.nil? }
end
