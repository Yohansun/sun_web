class Collect < ActiveRecord::Base
  belongs_to :design_image
  belongs_to :user
end