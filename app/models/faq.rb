class Faq < ActiveRecord::Base
  validates_presence_of :title, :content
  belongs_to :user
  has_many :comments, :as => :commentable

  paginates_per 10

  default_scope :order => "id desc"

  has_attached_file :img,
                    :styles => {:thumb => "403x270#"},
                    :whiny_thumbnails => true,
                    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  def comments_count
    self.comments.length
  end
end
