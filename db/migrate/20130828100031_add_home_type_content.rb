#encoding: utf-8
class AddHomeTypeContent < ActiveRecord::Migration
  def change
  	HomeType.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1	
  	HomeType.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2
  	HomeType.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 3
  	HomeType.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 4
  	HomeType.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 5
  	HomeType.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 6
  	HomeType.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 7
  	HomeType.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 8
  end
end
