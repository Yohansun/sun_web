class SeoSite < ActiveRecord::Base
  # attr_accessible :title, :body
  acts_as_cached(:version => 1, :expires_in => 1.week)
end
