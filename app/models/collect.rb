class Collect < ActiveRecord::Base
  belongs_to :design_image, :counter_cache => true
  belongs_to :user
  belongs_to :weekly_star
  belongs_to :design
  belongs_to :color_design
  belongs_to :master_design
end