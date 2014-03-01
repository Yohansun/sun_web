# encoding: utf-8
class CelebrityQuestion < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body

  validates_presence_of :name, message: "一句话描述必填"
  validates_length_of :name, in: 6..50, message: "一句话描述不得少于6个字"
  # validates_length_of :content, in: 6..100, allow_blank: true, message: "描述文字不得少于6个字"

  belongs_to :master_profile
  belongs_to :user
  belongs_to :delete_media, class_name: Media, foreign_key: :delete_media_id
  belongs_to :board, class_name: CelebrityContentBoard, foreign_key: :celebrity_content_board_id

  has_many :images, :class_name =>  CelebrityQuestionImage , :as => :resource, :dependent => :destroy

  has_many :replies, class_name: CelebrityQuestionReply, :dependent => :destroy

  has_one :media_reply, class_name: CelebrityQuestionReply, :dependent => :destroy

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

  def self.replied_count(board_id=nil)
    if board_id.present?
      ids = CelebrityQuestion.where("celebrity_content_board_id = ?",board_id.to_i).map(&:id)
      CelebrityQuestionReply.where("celebrity_question_id in (?) and media_id IS NOT NULL",ids).count
    else
      CelebrityQuestionReply.where("media_id IS NOT NULL",ids).count
    end
  end
end

