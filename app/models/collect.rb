class Collect < ActiveRecord::Base
  belongs_to :design_image, :counter_cache => true
  belongs_to :user
end