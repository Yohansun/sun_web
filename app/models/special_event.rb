class SpecialEvent < ActiveRecord::Base
  # attr_accessible :title, :body

  default_scope order("due_at DESC")
  scope :actived_event, where(:actived => true)

end
