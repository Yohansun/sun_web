class CelebrityContentBoard < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body
  belongs_to :media
  has_many :questions,   class_name: CelebrityQuestion
  has_many :treasuries,  class_name: EditorTreasury

  validate_presence_and_uniqueness_of :name
  validates_presence_of :media_id
end
