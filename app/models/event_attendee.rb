class EventAttendee < ActiveRecord::Base
  attr_accessible :special_event_id, :user_id, :image, :benediction

  attr_accessor :telephone, :image_title

  belongs_to :special_event
  belongs_to :user

  validates :special_event, :user, presence: true

  scope :joined_for,  lambda { |eid, uid| where(["special_event_id = ? and user_id = ?", eid, uid]) }

  def luckjoy(imaged = false, blessed = false)
    award = 'D'
    award = 'A' if imaged
    award = 'B' if blessed
    award = 'C' if imaged and blessed
    update_attribute(:award_mark, award)
    award
  end

  def sync_to_social(provider, suffix = "")
    unless self.benediction.blank?
      mood = self.user.moods.new(content: self.benediction)
      if mood.save
        self.user.user_tokens.where(["is_binding = ? and provider = ?", true, provider]).each do |token|
          Mood.send("send_#{token.provider}", access_token: token.access_token,
            content: mood.content + suffix)
        end
      end
    end
  end

end
