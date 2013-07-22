class PointExchange < ActiveRecord::Base
  belongs_to :area
  belongs_to :point_store
  belongs_to :point_product
  belongs_to :point_user

  scope :pass, where(status: true)
  scope :not_pass, where(status: false)

end
