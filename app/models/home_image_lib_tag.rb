class HomeImageLibTag < ActiveRecord::Base
  belongs_to :category, :class_name => "ImageLibraryCategory", :foreign_key => "category_id"

end
