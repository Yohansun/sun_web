class CelebrityContentBoard < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body

  has_many :questions,   class_name: CelebrityQuestion
  has_many :treasuries,  class_name: EditorTreasury
  has_many :notes,       class_name: CelebrityNote
  has_many :masters,     class_name: MasterProfile

  has_many :key_scopes,  class_name: CelebrityQuestionKeyScope

  validate_presence_and_uniqueness_of :name
  # validates_presence_of :media_id

  BACKGROUND_COLOR = { 1 => "rgb(2,155,199)", 2 => "rgb(254,152,54)",3 => "rgb(151,102,32)",4 => "rgb(0,153,45)",5 => "rgb(205,48,24)" }

  def color ; BACKGROUND_COLOR[id] || "rgb(247,247,247)" ; end
end
