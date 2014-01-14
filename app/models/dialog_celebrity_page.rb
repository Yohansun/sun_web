class DialogCelebrityPage < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :celebrity
  belongs_to :master_profile
end
