# encoding: utf-8
class StoryUser < ActiveRecord::Base
  attr_accessible :story_id, :user_id, :design_time
  belongs_to :story 
  belongs_to :user
  
  scope :current_month,->{where(design_time: Time.now.beginning_of_month..Time.now.end_of_month)}
  scope :uniq_story,->{select("distinct story_id")}
  
  after_create :send_msg
  private
  def send_msg
    #设计师XXX想要设计我发布的《XXXX》。
    SysMsg.send_to(self.story.user,"设计师<a href=/usres/#{self.user.id} >#{self.user.display_name}</a>想要设计我发布的《<a href=/love/stories/#{self.story.id}>房型图</a>》",
      {:reply_type => "baicheng",:re_url =>"/love/stories/#{self.story.id}"})  
    true
  end
  
  

  scope :story_ids, lambda{ |user_id| where(user_id: user_id) if user_id.present? }
end