class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :reply_user, :class_name => "User", :foreign_key => "reply_user_id"
  has_many :rep_replies
end
