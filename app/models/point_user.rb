class PointUser < ActiveRecord::Base
	belongs_to :user
	has_many :point_exchanges
  belongs_to :point_user, :class_name => "User", :foreign_key => "point_user_id"

  # User total product point
  def self.total_points user_id
  	where(user_id: user_id).collect{|item| item.point_exchanges.sum(:total_point) }.sum
  end

  # User pass total points
  def self.pass_total_points user_id
  	where(user_id: user_id).collect{|item| item.point_exchanges.pass.sum(:total_point) }.sum
  end

  # User total products points
  def self.user_pass_total_points user_id
  	@total_point = PointUser.total_points user_id
  	@user_gift_point = PointUserGift.user_points user_id
    @user_gift_point = @total_point - @user_gift_point
  end

  # User total points
  def self.user_total_points user_id
  	@pass_user_point = PointUser.pass_total_points user_id
  	@user_gift_point = PointUserGift.user_points user_id
    @user_total_point = @pass_user_point - @user_gift_point
  end

end
