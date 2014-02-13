class CelebrityQuestionReply < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :media
  belongs_to :question, :class_name => CelebrityQuestion, foreign_key: :celebrity_question_id
  has_many :images, :class_name =>  CelebrityQuestionImage , :as => :resource
end
