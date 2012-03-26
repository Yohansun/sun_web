class MasterProfile < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject
  attr_accessor :time
  default_scope order("published_at DESC")
end
