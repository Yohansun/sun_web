class EditorTreasury < ActiveRecord::Base
  include CelebrityModule

  # attr_accessible :title, :body
  belongs_to :celebrity_content_board

  validates :name, :content, :celebrity_content_board_id, presence: true

  validates_length_of :name, in: 6..50

  class << self
    def find_by_board board_id
      if board_id
        where(:celebrity_content_board_id => board_id)
      end
    end
  end
end
