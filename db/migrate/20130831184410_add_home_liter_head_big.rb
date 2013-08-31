#encoding: utf-8
class AddHomeLiterHeadBig < ActiveRecord::Migration
  def change
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 0, :genre => 0, :genre_type => "red"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 0, :genre => 1, :genre_type => "black"
  end
end
