class CelebrityNote < ActiveRecord::Base
  include CelebrityModule
  # attr_accessible :title, :body

  validates :name, :content , presence: true
  validates_length_of :name, in: 6..100

  belongs_to :author, class_name: MasterProfile, foreign_key: :master_profile_id
  belongs_to :board, class_name: CelebrityContentBoard, foreign_key: :celebrity_content_board_id

  has_attached_file :thumb,
    :styles => { :thumb => "280x145#" },
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
