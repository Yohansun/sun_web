#encoding: utf-8
class AddHomeColor < ActiveRecord::Migration
  def change
  	HomeColor.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1	
  	HomeColor.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2
  	HomeColor.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 3
  	HomeColor.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 4
  	HomeColor.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 5
  	HomeColor.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 6
  	HomeColor.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 7
  	HomeColor.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 8
  end
end
