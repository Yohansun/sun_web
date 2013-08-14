# -*- encoding : utf-8 -*-
class AddMessageToChannelTips < ActiveRecord::Migration
  def change
  	ChannelTip.create :title => "整体衣柜该如何保养？", :link => "/faqs", :content => "1、经常保持柜门的清洁，轨道内不能有杂物、尘土。清洁时可用半湿抹布擦拭柜体、柜门，切忌使用腐蚀性的清洁剂。", :rank => 1, admin_id: 1	
  	ChannelTip.create :title => "客厅装修有哪些注意事项？", :link => "/faqs", :content => "1、客厅灯光盏数不宜过多，简洁为好，否则像灯具店。2、可以考虑采用安在地面的金属插座，适合大的客厅。", :rank => 2, admin_id: 1
  	ChannelTip.create :title => "夏季施工只要注意一些重要事项", :link => "/faqs", :content => "先是室内空气要保湿，否则空气中的灰尘极容易吸附在油漆中，涂刷时容易产生气泡。同时，高温天，稀释剂挥发得快，油漆较其他季节更容易开裂...", :rank => 3, admin_id: 1
  end
end
