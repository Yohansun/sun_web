class ReplyMsg < ActiveRecord::Base
  attr_accessor :show_id

  belongs_to :user
  belongs_to :message
  belongs_to :source_reply, :class_name => "ReplyMsg", :foreign_key => "source_reply_id"
end
