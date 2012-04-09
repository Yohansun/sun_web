# -*- encoding : utf-8 -*-
class Maillist < ActiveRecord::Base
  validates_presence_of :email ,:message => "您输入的邮箱不能为空，请重新输入！"
  validates_format_of :email, :with => /^([a-z0-9\_\.]*[a-z0-9])(@)(([a-z0-9][a-z0-9\-]*[a-z0-9][\.])+(com|cn|net|hk|tw|au|uk|de|tv|info|biz))$/i, :message=> "您输入的邮箱格式不正确，请重新输入！"
  validates_uniqueness_of :email,:message => "您输入的邮箱已经被注册，请重新输入！"
end