#encoding: utf-8
class AddHomeStyle < ActiveRecord::Migration
  def change
  	HomeStyle.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1	
  	HomeStyle.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2
  	HomeStyle.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 3
  	HomeStyle.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 4
  	HomeStyle.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 5
  	HomeStyle.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 6
  	HomeStyle.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 7
  	HomeStyle.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 8
  end
end
