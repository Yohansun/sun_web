class SiteMessage < ActiveRecord::Base
  validates_presence_of :desc
  validates_length_of :desc, :minimum => 10
end
