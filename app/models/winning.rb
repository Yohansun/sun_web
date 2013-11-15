class Winning < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :winning_images,:class_name => "WinningImages"
end
