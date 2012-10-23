class SellerData < ActiveRecord::Base
  attr_accessible :sales, :product_top1, :product_top2, :product_top3, :user_id, :tool_ids, 
  								:apply_for_tools, :product_top1_quantity, :product_top2_quantity, 
  								:product_top3_quantity, :art_paint_quantity, :remarks		

  belongs_to :user
  belongs_to :seller_user

  scope :current_month, where("DATE_FORMAT(created_at, '%Y%m') = ? and apply_for_tools = ?", Time.now.strftime("%Y%m"), false)
  scope :last_month, where("DATE_FORMAT(created_at, '%Y%m') = ? and apply_for_tools = ?", Time.now.months_ago(1).strftime("%Y%m"), false)
  scope :apply_tools, where(:apply_for_tools => true, :created_at => Time.now.all_quarter)

  def product_top1_quantity
  	super.blank? ? 0 : super
  end

  def product_top2_quantity
    super.blank? ? 0 : super
  end

  def product_top3_quantity
    super.blank? ? 0 : super
  end
end