# encoding: utf-8

class User < ActiveRecord::Base

  validates_presence_of :username, :email, :if => :email_required?, :on => :create
  validates_presence_of :email, :on => :update
  validates_presence_of :password, :if => :email_required?, :on => :create
  validates_presence_of :is_read, :if => :email_required?, :on => :create
  validates_presence_of :phone, :message => "联系电话不能为空！", :if => :phone_required?
  validates_presence_of :role_id, :if => :not_from_minisite?, :on => :update
  validates_presence_of :area_id, :if => :not_from_minisite?, :on => :update
  validates_presence_of :role_id, :on => :create
  validates_presence_of :area_id, :on => :create
  validates_format_of :username, :with => /(?!_)(?![0-9])^[-_a-zA-Z0-9\u4e00-\u9fa5]/, :if => :email_required?, :on => :create
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :if => :email_required?
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :on => :update
  validates_format_of :qq, :with => /[1-9][0-9]{4,}/, :if => :email_required?, :allow_blank => true
  #validates_uniqueness_of :email, :allow_blank => false, :if => :email_required?, :on => :create
  validates_uniqueness_of :username, :allow_blank => false, :if => :email_required?, :on => :create
  validates_length_of :password, :within => 6..128, :allow_blank => false, :if => :email_required?, :on => :create
  #validates_uniqueness_of :phone, :allow_blank => true, :on => :create

  #用户注册完成后complete更新数据页面验证
  #validates_presence_of :recommended_name, :if => :recommended_requird?, :on => :update
  #validates_uniqueness_of :recommended_id, :scope => :id,:if => :recommended_requird? , :on => :update
  #可以添加座机号码
  #validates_format_of :phone, :with => /^(13|15|18)[0-9]{9}$/, :allow_blank => true, :on => :update
  #validates_format_of :name, :with => /^[\u4e00-\u9fa5]{2,4}$/, :allow_blank => true ,:on => :update
  #validates_format_of :zip_code, :with => /^\\d{6}$/, :allow_blank => true, :on => :update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :inauguration_company, :inauguration_address, :name,
                  :recipient_address, :zip_code, :phone, :sex, :recommended_name,
                  :des_status, :date_of_birth, :recommended, :state, :city, :district,
                  :role_id, :founded_of_company, :company_address, :name_of_company,
                  :recipient_address, :current_school, :school_address, :login, :user_role, :qq,
                  :msn, :fetion, :is_read, :recommended_id, :area_id, :created_at, :location, :signature, :old_id,
                  :is_show_email, :recommend_designer_status, :is_imported, :is_top, :top_reason

  attr_accessor :login, :recommended_name, :state, :city, :district, :user_role, :is_read

  belongs_to :role
  has_many :collects
  has_many :user_tokens
  has_many :inspirations
  has_many :designs
  has_many :design_images
  has_many :messages
  has_many :events, :class_name => "Event", :foreign_key => "user_id"
  has_one :avatar
  has_many :faqs
  has_many :site_messages
  has_many :sys_msgs
  has_many :events
  has_many :mix_colors
  has_many :customer_replies
  belongs_to :area
  has_many :reply_msgs
  has_many :replies
  has_many :scores
  has_many :votes
  has_many :comments
  has_one :yda_game
  has_many :seller_datas
  has_many :sms_logs
  has_many :moods
  has_many :login_logs
  has_one :phone_expense
  has_many :event_attendees
  has_many :baicheng_events
  #公司作品
  has_many :company_designs ,:class_name => "Design",:include => :user,:conditions => {:users => {:role_id => 2}} , :order => "designs.created_at desc"
  #个人作品
  has_many :personal_designs,:class_name => "Design",:include => :user,:conditions => {:users => {:role_id => 1}}
  #公司最新作品
  has_many :news_company_designs ,:through => :company_designs , :source => :design_images,:include => :user,:order => "design_images.created_at desc"
  #个人最新作品
  has_many :news_personal_designs,:through => :personal_designs, :source => :design_images,:include => :user,:order => "design_images.created_at desc"
  
  def news_company_design
    news_company_designs.first
  end
  
  def news_personal_design
    news_personal_designs.first
  end

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
      user_tokens.build(:provider => omniauth['provider'],
                        :uid => omniauth['uid'],
                        :access_token => omniauth['credentials']['token'])
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

  def phone_required?
    is_from_minisite? ? false : (not_from_minisite? || phone.blank?)
  end

  def display_name   #a little fix in when company company_name;name;username
    username = self.username.gsub("-sina", "").gsub("-kepulande", "") if self.username

    case role_name
      when /designer|user/
        self.name.blank? ? username : self.name
      when "company"
        if self.name_of_company.blank?
           if self.name.blank?
              return username
           else
              return self.name
           end
        else
           return self.name_of_company
        end
      end
  end

  def full_info
    [display_name, role_chn_name, "出生日期: #{date_of_birth}", email, user_location].compact.join(", ")
  end

  def role_name
    self.role ? self.role.role : 'user'
  end

  def city
    user_city = self.area.parent if self.area
  end

  def not_role?
    self.role_id.blank?
  end

  def job_designer?
    self.des_status == false && self.role_id == 1
  end

  def reading_designer?
    self.des_status && self.role_id == 1
  end

  def designer?
    self.role_id == 0 or self.role_id == 1
  end

  def company?
    self.role_id == 2
  end

  def common_user?
    self.role_id == 3
  end

  def unread_msgs
    self.sys_msgs.where(["status = ?", 0]).order("created_at")
  end

  def recommended_name
    self.recommended_name = User.find(self.recommended_id).username unless self.recommended_id.blank?
  end

  def total_score
    self.scores.sum(:amount)
  end

  def score_level
    @score_level = "普通会员"
    Score::ScoreLevel.each_with_index do |sl, index|
      if self.total_score > sl && self.total_score < Score::ScoreLevel[index+1]
        @score_level = Score::LevelName[index]
        break
      end
    end
    return @score_level
  end

  def next_level
    return Score::LevelName.rindex("#{self.score_level}").try(:next) || 0
  end

  def user_location
    if self.city.blank?
      (self.location == "NULL") ? "" : self.location
    else
      self.city.try(:name)
    end
  end

  #基础加分方法
  def create_score(user_id, type, status, amount, remark = "")
    Score.create(:user_id => user_id,
                :score_type => type,
                :status => status || 1,
                :amount => amount,
                :remark => remark
                )
  end

  #更新个人信息加分
  def update_detail(user)
    self.update_attributes(user)
    need_score = 0
    user.values.each do |a|
      unless a.blank?
        need_score += 10
      end
    end
    had_score = self.scores.where("score_type = ?", 101).sum(:amount)
    real_score = (had_score + need_score) >= 90 ? (90 - had_score) : need_score
    #公司 && 上限90
    if self.company? &&  had_score + need_score < 90
      self.create_score(self.id, 101, 1, real_score)
    end
    #设计师 && 上限120
    if self.designer? && had_score + need_score < 120
      self.create_score(self.id, 101, 1, real_score)
    end
  end

  #每日首次登陆
  def first_login_today(user)
    unless self.last_sign_in_at.today?
      self.create_score(user.id, 300, 1, 10)
    end
  end

  #分享加分
  def share_score(user, score_type)
    if self.scores.where("score_type in (500,501,502,503) and to_days(created_at) = to_days(now())").blank?
      self.create_score(user.id, score_type, 1, 20)
    end
  end

  #投票&被投票加分
  def vote_score(user = "", source_type, source_id)
    return "" if user.blank?
    design_score = self.scores.where("score_type =701 and to_days(created_at) = to_days(now())").sum(:amount)
    be_design_scoure = Design.find(source_id).user.scores.where("score_type =701 and to_days(created_at) = to_days(now())").sum(:amount) if source_type == "Design"
    insp_score   = self.scores.where("score_type =702 and to_days(created_at) = to_days(now())").sum(:amount)
    be_insp_scoure = Inspiration.find(source_id).user.scores.where("score_type =701 and to_days(created_at) = to_days(now())").sum(:amount) if source_type == "Inspiration"
    #作品
    if source_type == "Design" && design_score < 300
      be_uid = Design.find(source_id).user.id
      self.create_score(user.id, 701, 1, 30)
      if be_design_scoure < 500
        self.create_score(be_uid, 701, 1, 50)
      end
    end
    #灵感秀
    if source_type == "Inspiration" && design_score < 500
      be_uid = Inspiration.find(source_id).user.id
      self.create_score(user.id, 702, 1, 30)
      if be_insp_scoure < 500
        self.create_score(be_uid, 702, 1, 50)
      end
    end
  end

  def comment_score(user = "", comment)
    return "" if user.blank?
    if self.scores.where("score_type in (801,802,803,804)").sum(:amount) < 300
      #作品
      if comment['commentable_type'] == "Design" && self.scores.where("remark=? and to_days(created_at) = to_days(now())", comment['commentable_id']).blank?
        be_design_scoure = Design.find(comment['commentable_id']).user.scores.where("score_type = 801 and to_days(created_at) = to_days(now())").sum(:amount)

        be_uid = Design.find(comment['commentable_id']).user.id
        self.create_score(user.id, 801, 1, 30, comment['commentable_id'])
        if be_design_scoure < 500
          self.create_score(be_uid, 811, 1, 50, comment['commentable_id'])
        end
      end
      #灵感秀
      if comment['commentable_type'] == "Inspiration" && self.scores.where("remark=? and to_days(created_at) = to_days(now())", comment['commentable_id']).blank?
        be_insp_scoure = Inspiration.find(comment['commentable_id']).user.scores.where("score_type = 803 and to_days(created_at) = to_days(now())").sum(:amount)
        be_uid = Inspiration.find(comment['commentable_id']).user.id
        self.create_score(user.id, 803, 1, 30, comment['commentable_id'])
        if be_insp_scoure < 500
          self.create_score(be_uid, 813, 1, 50, comment['commentable_id'])
        end
      end
      #每周之星
      if comment['commentable_type'] == "WeeklyStar"
        return false
      end
      #实用工具
      if comment['commentable_type'] == ""
        return false
      end
      #回答问题
      if comment['commentable_type'] == "Faq"
        self.create_score(user.id, 1002, 1, 20, comment['commentable_id'])
      end
    end
  end

  def role_chn_name
    if self.des_status == false && self.role_id == 1
      return "在职设计师"
    elsif self.des_status && self.role_id == 1
      return "在读设计师"
    elsif self.role_id == 2
      return "公司"
    elsif self.role_id == 3
      return "普通用户"
    end
  end
  
  #只有角色是公司 取的收件地址才是公司地址(company_address), 其他都是收货地址(recipient_address)
  def role_address
    self.role_chn_name == "公司" ? self.company_address : self.recipient_address
  end

  def ydaed?
    self.yda_game ? true : false
  end

  def areas
    areas = self.area.self_and_ancestors.map { |e| e.name }
    areas[0] ||= ''
    areas[1] ||= ''
    areas[2] ||= ''
    areas
  end

  #获取用户话费信息
  def phone_expense_register;    self.phone_expense ? self.phone_expense.register : 0.0    end
  def phone_expense_design;      self.phone_expense ? self.phone_expense.design : 0.0      end
  def phone_expense_vote;        self.phone_expense ? self.phone_expense.vote : 0.0        end
  def phone_expense_comment;     self.phone_expense ? self.phone_expense.comment : 0.0     end
  def phone_expense_share;       self.phone_expense ? self.phone_expense.share : 0.0       end
  def phone_expense_inspiration; self.phone_expense ? self.phone_expense.inspiration : 0.0 end
  def phone_expense_total;       self.phone_expense ? self.phone_expense.total : 0.0       end

  protected
  def recommended_requird?
    recommended == true
  end

  def not_from_minisite?
    self.is_from_minisite != true && need_valid?
  end

  def need_valid?
    (self.created_at > Time.local(2012,'08','08',00,00,00)) if self.created_at
  end
end