class CelebrityQuestion < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body

  validates :name, :ask_id, :celebrity_content_id,:celebrity_question_category_id , presence: true
  validates_length_of :name, in: 6..50
  validates_length_of :content, in: 6..100, allow_nil: true

  belongs_to :celebrities
  belongs_to :asker,    class_name: User,  foreign_key: :asker_id
  belongs_to :replier,  class_name: User,  foreign_key: :replier_id
  belongs_to :board,    class_name: CelebrityContentBoard

  scope :replied,       ->{ where(is_replied: true).desc(:updated_at) }
  scope :not_replied,   ->{ where(is_replied: false).deac(:updated_at) }

  scope :replied_order, -> { order("is_replied asc,updated_at desc") }

  def replied?
    is_replied
  end

  def mark_as_reply
    update_attributes is_replied: true
  end

end

