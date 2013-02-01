#encoding: utf-8

# -*- encoding:utf-8 -*-

class EventAttendee < ActiveRecord::Base
  attr_accessible :special_event_id, :user_id, :image, :benediction

  attr_accessor :telephone, :image_title

  belongs_to :special_event
  belongs_to :user
  belongs_to :design_image

  validates :special_event, :user, presence: true

  scope :joined_for,  lambda { |eid, uid| where(["special_event_id = ? and user_id = ?", eid, uid]) }

  def luckjoy(imaged = false, user)
    award = 'D'

    return award unless user
    awards = user.event_attendees.map(&:award_mark) # 某一用户每次参与得奖集合
    has_award_today = EventAttendee.where(award_mark: 'C', created_at: Time.now.beginning_of_day..Time.now.end_of_day).count < MagicSetting.event_award_count.to_i

    # 第几次中奖
    award_at = MagicSetting.award_at.to_i

    if imaged
      award = 'A' unless awards.include? 'A'

      if awards.size >= award_at && has_award_today
        award = 'C' unless awards.include?('C')
      end
    end

    award
  end

  def sync_to_social(provider, suffix = "", pic=false)
    unless self.benediction.blank? && suffix.blank?
      mood = self.user.moods.new(content: self.benediction || suffix)
      if pic 
        image = File.open(pic)
        mood.img = image
      end
      if mood.save
        self.user.user_tokens.where(["provider = ?", provider]).each do |token|
          if pic
            image = File.open(pic)
            result = Mood.send("send_pic_#{token.provider}", access_token: token.access_token,
                                content: mood.content, pic: image)
          else
            result = Mood.send("send_#{token.provider}", access_token: token.access_token,
              content: mood.content + suffix)
          end
        end
      end
    end
  end
end
