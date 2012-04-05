class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :from_user, :class_name => "User", :foreign_key => "from_user_id"
  default_scope order("created_at DESC")
  paginates_per 5
end