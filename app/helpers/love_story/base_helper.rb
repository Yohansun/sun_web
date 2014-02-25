# encoding: utf-8
module LoveStory::BaseHelper

  def love_story_title
    if controller_name == 'home'
      '为爱刷新,爱的故事,设计作品展示,设计师精选-立邦iColor官方网站'
    elsif controller_name == 'love_stories'
      '为爱刷新,爱的故事,设计作品展示,设计师精选-立邦iColor官方网站'
    elsif controller_name == 'minisite_designs'
      '【设计作品展示】设计师精选设计案例欣赏,为爱刷新-立邦iColor官方网站'
    elsif controller_name == 'minisite_stars'
      '【设计师精选】设计名家,为爱刷新-立邦iColor官方网站'
    elsif controller_name == 'minisite_weekly_stars'
      '【设计师精选】icolor设计之星,为爱刷新-立邦iColor官方网站'
    else
      '为爱刷新,爱的故事,设计作品展示,设计师精选-立邦iColor官方网站'
    end
  end

  def love_story_description
    if controller_name == 'home'
      '为爱刷新让装修充满爱的意义,记录和分享与自己爱的人的故事,感动你我他,还有最新最经典的设计师设计作品展示,在这里您还可以定制自己的私人设计师。'
    elsif controller_name == 'love_stories'
      '记录和分享爱的故事,让装修充满永久的回忆,让温暖小屋成为真爱的见证。'
    elsif controller_name == 'minisite_designs'
      '设计作品展示包括最新大师作品，最热设计作品与装修效果图精华推荐。'
    elsif controller_name == 'minisite_stars'
      '设计师精选之设计名家频道有装修界中知名设计师及头像,姓名和头衔等资料。'
    elsif controller_name == 'minisite_weekly_stars'
      '设计师精选之icolor设计之星频道包括被评为icolor之星的经典设计产品展示。'
    else
      '为爱刷新让装修充满爱的意义,记录和分享与自己爱的人的故事,感动你我他,还有最新最经典的设计师设计作品展示,在这里您还可以定制自己的私人设计师。'
    end
  end

  def love_story_keyword
    if controller_name == 'home'
      '为爱刷新,爱的故事,设计作品展示,设计师精选'
    elsif controller_name == 'love_stories'
      '爱的故事,自己爱的人,为爱刷新'
    elsif controller_name == 'minisite_designs'
      '设计作品展示,作品案例,设计案例,为爱刷新'
    elsif controller_name == 'minisite_stars'
      '设计师精选,设计名家,为爱刷新'
    elsif controller_name == 'minisite_weekly_stars'
      '设计师精选,icolor设计之星,为爱刷新'
    else
      '为爱刷新,爱的故事,设计作品展示,设计师精选'
    end
  end
end
