# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Role.create([{ :role => 'designer' }, { :role => 'company' }, { :role => 'user' }])

Subject.create(:name => "一周贴士", :slug => "weekly_tips", :content_type => "WeeklyTip")
Subject.create(:name => "装修资讯", :slug => "articles", :content_type => "Post")
Subject.create(:name => "大师设计作品", :slug => "master_designs", :content_type => "MasterDesign")
Subject.create(:name => "大师访谈", :slug => "master_profile", :content_type => "MasterProfile")
Subject.create(:name => "大师热点话题", :slug => "master_topics", :content_type => "Post")
Subject.create(:name => "色彩搭配", :slug => "color_designs", :content_type => "ColorDesign")
Subject.create(:name => "每周之星", :slug => "weekly_stars", :content_type => "WeeklyStar")