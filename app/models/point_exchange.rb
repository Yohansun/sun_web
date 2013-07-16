class PointExchange < ActiveRecord::Base
  belongs_to :area
  belongs_to :point_store
  belongs_to :point_product
  belongs_to :point_user

end
