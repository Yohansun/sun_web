class Celebrity < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body
  belongs_to :major,     class_name: CelebrityCategory
  has_many   :questions, class_name: CelebrityQuestion
  has_many   :note,      class_name: CelebrityNote

  validates :name, :intro, :celebrity_category_id, presence: true
end
