class CelebrityQuestionKeyScope < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :board, class_name: CelebrityContentBoard

  validates_presence_of :name

  serialize :key_arr
end
