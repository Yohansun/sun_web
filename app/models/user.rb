class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :inauguration_company, :inauguration_address, :name,
                  :recipient_address, :zip_code, :phone, :sex, :recommended_name,
                  :des_status, :date_of_birth, :recommended, :state, :city, :district,
                  :role_id, :founded_of_company, :company_address, :name_of_company,
                  :recipient_address,:current_school,:school_address,:login

  attr_accessor :login, :recommended_name, :state, :city, :district

  belongs_to :role

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login      = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value OR phone = :value", { :value => login.strip.downcase }]).first
  end
end
