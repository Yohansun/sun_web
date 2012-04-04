class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :inspiration, :counter_cache => true
	paginates_per 10
end
