class EditorTreasury < ActiveRecord::Base
  include CelebrityModule

  # attr_accessible :title, :body
  belongs_to :celebrity_content_board

  validates :name, :content, :celebrity_content_board_id, presence: true

  validates_length_of :name, in: 6..50

  has_attached_file :thumb,
    :styles => { :thumb => "280x145#" },
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  class << self
    def find_by_board board_id
      if board_id
        where(:celebrity_content_board_id => board_id)
      end
    end
  end
end
