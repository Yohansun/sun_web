class PointUserGift < ActiveRecord::Base
  
  def self.user_points user_id
  	where(user_id: user_id).sum(:total_point)
  end

end
