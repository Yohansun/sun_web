# -*- encoding : utf-8 -*-
class AddOwnerEntry < ActiveRecord::Migration
  def change
  	OwnerEnter.create :title => "点击“编辑“来修改标题", :link => "点击“编辑“来修改链接", :content => "点击“编辑“来修改content", :order_id => 1	
  	OwnerEnter.create :title => "点击“编辑“来修改标题", :link => "点击“编辑“来修改链接", :content => "点击“编辑“来修改content", :order_id => 2
  end
end
