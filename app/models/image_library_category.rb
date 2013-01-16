# -*- encoding : utf-8 -*-
class ImageLibraryCategory < ActiveRecord::Base
	acts_as_tree 
  attr_accessible :parent_id, :title
end
