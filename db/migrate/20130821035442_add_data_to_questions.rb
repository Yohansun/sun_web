# -*- encoding : utf-8 -*-
class AddDataToQuestions < ActiveRecord::Migration
  def change
    Question.create :title => "夏季施工只要注意一些重要事项", :link => "/faqs", :rank => 1, admin_id: 1  
    Question.create :title => "夏季施工只要注意一些重要事项", :link => "/faqs" , :rank => 2, admin_id: 1
    Question.create :title => "夏季施工只要注意一些重要事项", :link => "/faqs" , :rank => 3, admin_id: 1
    Question.create :title => "夏季施工只要注意一些重要事项", :link => "/faqs" , :rank => 4, admin_id: 1
    Question.create :title => "夏季施工只要注意一些重要事项", :link => "/faqs" , :rank => 5, admin_id: 1
  end
end
