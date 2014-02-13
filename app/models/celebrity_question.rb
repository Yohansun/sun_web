class CelebrityQuestion < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body

  validates :name, presence: true
  validates_length_of :name, in: 6..50
  validates_length_of :content, in: 6..100, allow_nil: true

  belongs_to :master_profile
  belongs_to :user
  belongs_to :board, class_name: CelebrityContentBoard, foreign_key: :celebrity_content_board_id

  has_many :images, :class_name =>  CelebrityQuestionImage , :as => :resource

  has_many :replies, class_name: CelebrityQuestionReply

  has_one :media_reply, class_name: CelebrityQuestionReply

  scope :replied_order, -> { order("is_replied asc,updated_at desc") }

  def replied?
    find_media_reply.present?
  end

  def mark_as_reply
    update_attributes is_replied: true
  end

  def find_media_reply
    replies.where("media_id IS NOT NULL").first
  end

  def user_replies
    replies.where("user_id IS NOT NULL")
  end
end

