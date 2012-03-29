class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :inauguration_company, :inauguration_address, :name,
                  :recipient_address, :zip_code, :phone, :sex, :recommended_name,
                  :des_status, :date_of_birth, :recommended, :state, :city, :district,
                  :role_id, :founded_of_company, :company_address, :name_of_company,
                  :recipient_address,:current_school,:school_address,:login

  attr_accessor :login, :recommended_name, :state, :city, :district

  belongs_to :role
  has_many :user_tokens

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login      = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value OR phone = :value", { :value => login.strip.downcase }]).first
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session[:omniauth]
        user.user_tokens.build(:provider => data['provider'], :uid => data['uid'])
      end
    end
  end

  def apply_omniauth(omniauth)
    #add some info about the user
    self.name = omniauth['name'] if name.blank?
    self.sex = omniauth['sex'] if sex.blank?
    self.location = omniauth['location'] if location.blank?

    unless omniauth['credentials'].blank?
      user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
      #user_tokens.build(:provider => omniauth['provider'],
      #                  :uid => omniauth['uid'],
      #                  :token => omniauth['credentials']['token'],
      #                  :secret => omniauth['credentials']['secret'])
    else
      user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    end
    #self.confirm!# unless user.email.blank?
  end

  def password_required?
    (user_tokens.empty? || !password.blank?) && super
  end

  def email_required?
    (user_tokens.empty? || !email.blank?) && super
  end
end