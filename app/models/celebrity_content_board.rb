class CelebrityContentBoard < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body
  belongs_to :media
  has_many :questions,   class_name: CelebrityQuestion
  has_many :treasuries,  class_name: EditorTreasury
  has_many :notes,       class_name: CelebrityNote
  has_many :masters,     class_name: MasterProfile

  has_many :key_scopes,  class_name: CelebrityQuestionKeyScope

  validate_presence_and_uniqueness_of :name
  validates_presence_of :media_id
end
