class CelebrityNote < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body

  validates :name, :content, :celebrity_id , presence: true
  validates_length_of :name, in: 6..100

  belongs_to :celebrity

end
