# -*- encoding: utf-8 -*-
class YdaGame < ActiveRecord::Base
	validates_presence_of :name, :message => "姓名不能为空！"
	validates_presence_of :school, :message => "院校不能为空！"
	validates_presence_of :specialty, :message => "专业不能为空！"
	validates_presence_of :grade, :message => "年纪不能为空！"
	validates_presence_of :paperwork_no, :message => "有效证件不能为空！"
	validates_presence_of :mobile, :message => "手机不能为空！"
	validates_presence_of :address, :message => "地址不能为空！"
	validates_presence_of :city, :message => "城市不能为空！"
	validates_presence_of :country, :message => "国家不能为空！"
	validates_presence_of :postcode, :message => "邮编不能为空！"
	validates_presence_of :email, :message => "邮箱不能为空！"
	belongs_to :user
end
