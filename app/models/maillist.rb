# -*- encoding : utf-8 -*-
class Maillist < ActiveRecord::Base
  validates_presence_of :email
  validates_format_of :email, :with => /^([a-z0-9\_\.]*[a-z0-9])(@)(([a-z0-9][a-z0-9\-]*[a-z0-9][\.])+(com|cn|net|hk|tw|au|uk|de|tv|info|biz))$/i, :message => "格式错误"
end