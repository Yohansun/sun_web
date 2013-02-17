class RepReply < ActiveRecord::Base
  attr_accessor :show_id
  belongs_to :reply
  belongs_to :user
  belongs_to :source_reply, :class_name => "RepReply", :foreign_key => "source_reply_id"
end
