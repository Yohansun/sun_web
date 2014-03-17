class HomeDialogCelebrity < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :images, class_name: HomeDialogCelebrityImage,:dependent => :destroy
end
