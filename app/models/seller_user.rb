class SellerUser < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :username, :login, :area_id, :mobile, :phone, :psd, :area_name

  attr_accessor :login, :area_name

  has_many :seller_datas
  has_many :sms_logs

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login      = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value ", { :value => login.strip.downcase }]).first
  end

  def password=(value)
    self.psd = value
    super
  end

  def area_name=(value)
    array = value.split(":")
    if array.size.eql? 1
      self.area_id = Area.where("name like ?", "%#{value}%").first.id
    else
      self.area_id = value.split(":").last
    end
  end

  def top_remain
    top_record = self.top_record
    
    if top_record.present? && Time.now.all_quarter.cover?(top_record.split("/")[1].to_datetime)
      10 - self.top_record.split("/")[0].to_i
    else
      10
    end  
  end
end