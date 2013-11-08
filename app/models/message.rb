class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :from_user, :class_name => "User", :foreign_key => "from_user_id"
  has_many :reply_msgs
  default_scope order("id desc")
  paginates_per 5
end
