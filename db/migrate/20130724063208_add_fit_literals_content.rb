# -*- encoding : utf-8 -*-
class AddFitLiteralsContent < ActiveRecord::Migration
  def change
  	FitLiteral.create :title => "点击“编辑“来修改标题", :link => "点击“编辑“来修改链接", :order_id => 1	
  	FitLiteral.create :title => "点击“编辑“来修改标题", :link => "点击“编辑“来修改链接", :order_id => 2
  	FitLiteral.create :title => "点击“编辑“来修改标题", :link => "点击“编辑“来修改链接", :order_id => 3
  	FitLiteral.create :title => "点击“编辑“来修改标题", :link => "点击“编辑“来修改链接", :order_id => 4
  	FitLiteral.create :title => "点击“编辑“来修改标题", :link => "点击“编辑“来修改链接", :order_id => 5
  	FitLiteral.create :title => "点击“编辑“来修改标题", :link => "点击“编辑“来修改链接", :order_id => 6
  end
end
