class PointUser < ActiveRecord::Base
	belongs_to :user
	has_many :point_exchanges
  belongs_to :point_user, :class_name => "User", :foreign_key => "point_user_id"

end
