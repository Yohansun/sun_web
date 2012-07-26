class LoginLog < ActiveRecord::Base
  attr_accessible :user_id, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip

  belongs_to :user
end  
