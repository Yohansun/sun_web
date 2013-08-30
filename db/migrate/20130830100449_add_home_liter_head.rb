#encoding: utf-8
class AddHomeLiterHead < ActiveRecord::Migration
  def change
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1, :genre => 0, :genre_type => "red"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2, :genre => 0, :genre_type => "red"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 3, :genre => 0, :genre_type => "red"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 4, :genre => 0, :genre_type => "red"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1, :genre => 1, :genre_type => "black"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2, :genre => 1, :genre_type => "black"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 3, :genre => 1, :genre_type => "black"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 4, :genre => 1, :genre_type => "black"
    HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1, :genre => 2, :genre_type => "color"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2, :genre => 2, :genre_type => "color"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1, :genre => 3, :genre_type => "cost"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2, :genre => 3, :genre_type => "cost"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1, :genre => 4, :genre_type => "style"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2, :genre => 4, :genre_type => "style"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1, :genre => 5, :genre_type => "space"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2, :genre => 5, :genre_type => "space"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 1, :genre => 6, :genre_type => "type"
  	HomeLiterHead.create :title => "标题不超过12个字", :link => "点击“编辑“来修改链接", :order_id => 2, :genre => 6, :genre_type => "type"
  end
end
