#encoding: utf-8
class AddHomeCost < ActiveRecord::Migration
  def change
  	HomeCost.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1	
  	HomeCost.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2
  	HomeCost.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 3
  	HomeCost.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 4
  	HomeCost.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 5
  	HomeCost.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 6
  	HomeCost.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 7
  	HomeCost.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 8
  end
end
