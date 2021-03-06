# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  has_many :reply_msgs, :dependent => :destroy, :order => "id DESC"
  has_many :votes, :as => :voteable

  validates_presence_of :content

  default_scope :order => "id DESC"
  paginates_per 10
  after_save :send_sys_msg
  def send_sys_msg
    if self.user
      user_display_name = self.user.display_name
      user_id = self.user.id
      SysMsg.create(:content => "亲爱的#{user_display_name}用户，您的评论已成功！",
        :reply_type => "site_message", :status => SysMsg::Status[0], :reply_name => "iColor客服",
        :user_id => user_id, :re_url => "/" + self.commentable_type.tableize + "/" + self.commentable_id.to_s)

      case self.commentable_type
      when "Design"

        @design = Design.find self.commentable_id
        if @design.story
          story =  @design.story
          SysMsg.send_to(story.user,  "<a href=/users/#{user_id}> #{user_display_name}</a>对为我设计的《<a href=/love/stories/#{story.id}>房型图</a>》 进行了留言。",{:reply_type => "baicheng",
             :re_url =>"/love/stories/#{story.id}"}   )
          SysMsg.send_to(@design.user,  "<a href=/users/#{user_id}> #{user_display_name}</a>对我上传的原创设计《<a href=/love/design_competes/#{@design.id}>#{@design.title}</a>》进行了评论。",
            {:reply_type => "baicheng", :re_url =>"/love/design_competes/#{@design.id}"})
         end
      when "Inspiration"
        @design = Inspiration.find self.commentable_id
      when "DesignImage"
        @design = DesignImage.find self.commentable_id
      when 'Story'
        story = Story.find self.commentable_id
        SysMsg.send_to(story.user,  "<a href=/users/#{user_id}> #{user_display_name}</a>对我发布的《<a href=/love/stories/#{story.id}>房型图</a>》进行了留言。",
          {:reply_type => "baicheng",:re_url =>"/love/stories/#{story.id}"})
      end
      if @design
        SysMsg.create(:content => "亲爱的#{@design.user.display_name}用户，您的作品 <<a href=/users/#{@design.user_id}/designs/#{@design.id}>#{@design.title}</a>> 收到了新的回复，请注意查看！",
          :reply_type => "site_message", :status => SysMsg::Status[0], :reply_name => "iColor客服",
          :user_id => @design.user.id, :re_url => "/" + self.commentable_type.tableize + "/" + self.commentable_id.to_s)
      end
    end
  end
end