class WeeklyTip < ActiveRecord::Base
  belongs_to :subject
  attr_accessor :time
  default_scope order("created_at DESC")

  paginates_per 5
end
