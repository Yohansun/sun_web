class Contract < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :contract_images
end
