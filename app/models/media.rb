class Media < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body
  belongs_to :user
  has_many   :boards, class_name: CelebrityContentBoard
end
