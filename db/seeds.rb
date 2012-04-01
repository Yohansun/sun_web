# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Role.create([{ :role => 'designer' }, { :role => 'company' }, { :role => 'user' }])

Subject.create(:slug => "weekly_tips", :content_type => "WeeklyTip")
Subject.create(:slug => "articles", :content_type => "Post")
Subject.create(:slug => "master_designs", :content_type => "MasterDesign")
Subject.create(:slug => "master_profile", :content_type => "MasterProfile")
Subject.create(:slug => "master_topics", :content_type => "Post")