class SmsLog < ActiveRecord::Base
  attr_accessible :content, :response, :send_id, :result, :description, :seller_user_id, :user_id

  belongs_to :user
  belongs_to :seller_user
end
