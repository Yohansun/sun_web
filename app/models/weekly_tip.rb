class WeeklyTip < ActiveRecord::Base
  belongs_to :subject
  attr_accessor :time
  default_scope order("published_at DESC")

  paginates_per 1
end
