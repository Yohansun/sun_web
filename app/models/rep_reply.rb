class RepReply < ActiveRecord::Base
  attr_accessor :show_id
  belongs_to :reply
  belongs_to :user
  belongs_to :source_reply, :class_name => "RepReply", :foreign_key => "source_reply_id"
  belongs_to :comment
  after_create :send_msg
  
  private
  
  def send_msg
    if self.reply_type =='stories'
      SysMsg.send_to(self.comment.user,  "<a href=/users/#{self.comment.user.id}> #{self.comment.user.display_name}</a>在我对其<<<a href=/love/stories/#{self.comment.commentable.id}>房型图</a> >>所做的留言进行了回复。",:reply_type => "baicheng"   )
    end
    #    XXX在我对其《XXXX》所做的留言进行了回复。
  end
end
