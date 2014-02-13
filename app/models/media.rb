class Media < ActiveRecord::Base
  # attr_accessible :title, :body
  serialize :boards

  has_one :reply, :class_name => CelebrityQuestionReply

  def encrypt_password!
    self.password = self.class.encrypt_password(self.password)
    self.save
  end

  def self.encrypt_password pwd
    Digest::SHA2.hexdigest(pwd).upcase
  end

  def self.auth username,pwd
    self.where(username: username, password: self.encrypt_password(pwd)).first
  end
end
