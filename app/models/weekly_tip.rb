class WeeklyTip < ActiveRecord::Base
  belongs_to :subject
  attr_accessor :time
  default_scope order("id desc")

  paginates_per 5
end
