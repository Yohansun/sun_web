class TagSort < ActiveRecord::Base
  # attr_accessible :title, :body
  def category(id)
  	ImageLibraryCategory.where("parent_id = ?", id)
  end
end
