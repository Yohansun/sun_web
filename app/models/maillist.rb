# -*- encoding : utf-8 -*-
class Maillist < ActiveRecord::Base
  validates_presence_of :email ,:message => "您输入的邮箱不能为空，请重新输入！"
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ , :message => "您输入的邮箱格式不正确，请重新输入！"
  validates_uniqueness_of :email,:message => "您输入的邮箱已经被注册，请重新输入！"
end