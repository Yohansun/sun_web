class Contract < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :contract_images
  belongs_to :user,:foreign_key => "u_id"
end
