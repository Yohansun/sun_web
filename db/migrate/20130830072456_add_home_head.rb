  #encoding: utf-8
class AddHomeHead < ActiveRecord::Migration
    HomeHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1	
  	HomeHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2
  	HomeHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 3
end
