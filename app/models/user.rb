class User < ActiveRecord::Base

  validates_presence_of :username, :email, :if => :email_required?
  validates_presence_of :password, :if => :email_required?, :on => :create
  validates_presence_of :is_read, :if => :email_required?, :on => :create
  validates_format_of :username, :with => /(?!_)(?![0-9])^[-_a-zA-Z0-9\u4e00-\u9fa5]/, :if => :email_required?
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :if => :email_required?
  validates_format_of :qq, :with => /[1-9][0-9]{4,}/, :if => :email_required?, :allow_blank => true
  validates_uniqueness_of :email, :allow_blank => false, :if => :email_required?, :on => :create
  validates_uniqueness_of :username, :allow_blank => false, :if => :email_required?
  validates_length_of :password, :within => 6..128, :allow_blank => false, :if => :email_required?, :on => :create

  #用户注册完成后complete更新数据页面验证
  #validates_presence_of :recommended_name, :if => :recommended_requird?, :on => :update
  #validates_uniqueness_of :recommended_id, :scope => :id,:if => :recommended_requird? , :on => :update
  validates_format_of :phone, :with => /^(13|15|18)[0-9]{9}$/, :allow_blank => true, :on => :update
  validates_uniqueness_of :phone, :allow_blank => true, :on => :update
  validates_format_of :name, :with => /^[\u4e00-\u9fa5]{2,4}$/, :allow_blank => true, :on => :update
  #validates_format_of :zip_code, :with => /^\\d{6}$/, :allow_blank => true, :on => :update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :inauguration_company, :inauguration_address, :name,
                  :recipient_address, :zip_code, :phone, :sex, :recommended_name,
                  :des_status, :date_of_birth, :recommended, :state, :city, :district,
                  :role_id, :founded_of_company, :company_address, :name_of_company,
                  :recipient_address, :current_school, :school_address, :login, :user_role, :qq,
                  :msn, :fetion, :is_read, :recommended_id

  attr_accessor :login, :recommended_name, :state, :city, :district, :user_role, :is_read

  belongs_to :role
  has_many :user_tokens
  has_many :inspirations
  has_many :designs
  has_many :design_images
  has_many :messages


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

  def display_name
    self.name.blank? ? self.username : self.name
  end

  def role_name
    self.role ? self.role.role : 'user'
  end

  protected
  def recommended_requird?
    recommended == true
  end

end