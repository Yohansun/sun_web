class User < ActiveRecord::Base

  validates_presence_of :username, :email, :password, :is_read, :on => :create
  validates_format_of :username, :with => /(?!_)(?![0-9])^[-_a-zA-Z0-9\u4e00-\u9fa5]/, :on => :create
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :on => :create
  validates_uniqueness_of :username, :email, :allow_blank => false, :on => :create
  validates_length_of :password, :within => 6..128, :allow_blank => false, :on => :create

  #用户注册完成后improve更新数据页面验证
  #validates_presence_of :recommended_name, :if => :recommended_requird?
  validates_format_of   :phone, :with => /^(13|15|18)[0-9]{9}$/, :allow_blank => true
  validates_uniqueness_of :phone, :allow_blank => true
  validates_format_of   :name, :with => /^[\u4e00-\u9fa5]{2,4}$/, :allow_blank => true
  validates_format_of   :zip_code, :with => /^\\d{6}$/, :allow_blank => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :inauguration_company, :inauguration_address, :name,
                  :recipient_address, :zip_code, :phone, :sex, :recommended_name,
                  :des_status, :date_of_birth, :recommended, :state, :city, :district,
                  :role_id, :founded_of_company, :company_address, :name_of_company,
                  :recipient_address, :current_school, :school_address, :login, :role, :qq,
                  :msn, :fetion, :is_read

  attr_accessor :login, :recommended_name, :state, :city, :district, :role, :is_read

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

  protected
  def recommended_requird?
     recommended == true
  end

end