#encoding: utf-8
class AddHomeSpace < ActiveRecord::Migration
    HomeSpace.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1	
  	HomeSpace.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2
  	HomeSpace.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 3
  	HomeSpace.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 4
  	HomeSpace.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 5
  	HomeSpace.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 6
  	HomeSpace.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 7
  	HomeSpace.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 8
end
