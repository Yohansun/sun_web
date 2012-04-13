# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
    @weibo_data = WeiboData.where(:q => "放飞色彩心愿清单").where("thumbnail_pic IS NOT NULL").order("created_time DESC").limit(18).all

    #每周之星
    @week_star = WeeklyStar.first

    #家装资讯
    @home_infos = Subject.content("articles").limit(3)
    #大师访谈
    @master_interview = MasterProfile.first

    #热点话题
    @hot_topic = Subject.content("master_topics").first

    #大师作品
    @master_design = MasterDesign.first

    #TODO灵感秀
    @inspirations = ""

    #推荐作品  TODO group_by 不知道数据多了以后翻页效果如何，待测试
#    @design_groups = Design.select([:id, :shares_count]).group_by{|a| index = a.id%2==0}
#    @designs_odd = @design_groups[false]
#    @designs_even = @design_groups[true]
    @designs = Design.all

    #行业资讯
    @articles = Subject.content("articles").limit(5)
  end
end
