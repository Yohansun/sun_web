class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  default_scope :order => "created_at DESC"
  paginates_per 10
end
