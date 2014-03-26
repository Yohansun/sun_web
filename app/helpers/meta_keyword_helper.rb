# encoding: utf-8
module MetaKeywordHelper
  def keyword_content
    star_key = "iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    inspirations_key = "立邦iColor,立邦,家装设计,装修设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    softwares_key = "iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    art_key = "iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    designer_events_key = "iColor立邦活动,设计师活动,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    rescue_keyword = "iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"

    #对话名人
    if controller_path == 'dialog_celebrity/home' && controller_name == 'home'
      "对话名人,名家设计,名人问答,名人在线"
    elsif controller_path == 'dialog_celebrity/master_profiles' && controller_name == 'master_profiles'
      if action_name == 'maste_interviews'
        "名家设计,空间设计,色彩设计,对话名人"
      elsif action_name == 'master_interview'
        @master.try(:name) + ",装修作品"
      elsif action_name == 'celebrities'
        "名人在线,名人介绍,名家手记,对话名人"
      else
        "对话名人,名家设计,名人问答,名人在线"
      end
    elsif controller_path == 'dialog_celebrity/celebrity_questions' && controller_name == 'celebrity_questions'
      "名人问答,装修问题,对话名人"
    elsif controller_path == 'dialog_celebrity/celebrity_notes' && controller_name == 'celebrity_notes'
      "名家手记,装修知识,对话名人"
    elsif controller_path == 'dialog_celebrity/editor_treasuries' && controller_name == 'editor_treasuries'
      "小编宝典,名家设计作品,设计作品推荐,对话名人"
    elsif controller_path == 'dialog_celebrity/master_designs' && controller_name == 'master_designs'
      @master.try(:master_field) + ",#{@master.try(:name)},#{@master.try(:name)}装修效果图欣赏,对话名人"
    #首页
    elsif controller_name == 'home' && action_name == 'index'
      "怎么装修设计,室内装潢装饰设计,室内家装设计,装修效果图,立邦,iColor"
    #刷新生活
    elsif controller_name == 'refresh_record' && action_name == 'show'
      refresh_base_key = "立邦iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
      if params[:id] == "35"
        "立邦iColor,立邦,家装设计,装修效果图,室内装修,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,装修图片"
      elsif %w{34 33 32 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7}.include?(params[:id])
        refresh_base_key
      else
        rescue_keyword
      end
    elsif controller_name == 'refresh_record'
      "立邦iColor,立邦,家装设计,装修效果图,室内装修,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,装修图片"
    elsif controller_name == 'refresh_show'
      "立邦iColor,立邦,家装设计,装修效果图,室内装修,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,装修图片"
    elsif controller_name == 'refresh_list'
      rescue_keyword
    #大师访谈
    elsif %w{master_interviews master_designs}.include?(controller_name) && params[:type] == 'shinei'
      "立邦iColor,立邦,家装设计,室内空间设计师,色彩设计师,装修设计师,明星设计师,家装经典作品,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif %w{master_interviews master_designs}.include?(controller_name) && params[:type] == 'color'
      "立邦iColor,立邦,家装设计,色彩设计师,室内设计师,装修设计大师,明星设计师,装修设计大师,室内空间设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'master_interviews' && %w{index all}.include?(action_name)
      "立邦iColor设计师访谈,iColor,立邦,家装设计,海外设计师,国际设计师,香港,台湾,港澳台设计师.中国设计师,室内设计师,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'oversea'
      "立邦iColor设计大师访谈,iColor,立邦,家装设计,海外设计师.国际设计师,装修大师,室内设计师,装修设计师,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'hk_tw_mc'
      "立邦iColor设计大师访谈,iColor,立邦,家装设计,香港,台湾,港澳台设计师,装修大师,室内设计师,装修设计师,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'cn'
      "立邦iColor设计师访谈,iColor,立邦,家装设计,中国设计师,装修大师,室内设计师,装修设计师,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'master_interviews' && action_name == 'show'
      "立邦iColor,立邦,家装设计,iColor设计大师,#{@article.name},作品,简介,访谈,寄语,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #大师作品
    elsif controller_name == 'master_designs' && %w{index all}.include?(action_name)
      "iColor设计师,室内空间大师,色彩设计大师,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'master_designs' && action_name == 'show'
      "#{@master_design.design_name},#{@master_design.master_profile.try(:name) || @master_design.master_name},家居家居装饰,装修建材,建材导购室内装修,装修图片,装修效果图,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #装修图库
    elsif controller_name == 'design_images' && action_name == 'lists'
      "立邦iColor,立邦,家装设计,室内装修,装修设计图片,装修效果图,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材"
    elsif controller_name == 'design_images' && action_name == 'index'
      case params[:path]
      when '0-0-359-0-0-0-0-0-0-126-0-0-0_0_0_0_0_0'
        '装修罗马柱,样板房装修,欧式古典风格装修,装修效果图,立邦,iColor'
      when '0-0-0-0-0-0-72-0-0-125-0-0-0_0_0_0_0_0'
        '出租房装修,装修设计,装修效果图,立邦,iColor'
      when '0-0-0-0-0-56-0-0-0-0-0-0-0_0_0_0_0_0'
        '波西米亚装修风格,波西米亚家居,装修风格,装修效果图,iColor,立邦'
      when '13-0-0-89-0-0-0-0-0-0-0-0-0_0_0_0_0_0'
        '露台装修,阳台装修设计,错层,家居装修,装修效果图,iColor,立邦'
      when '0-0-0-0-0-38-0-0-0-0-0-0-0_0_0_0_0_0'
        '混搭装修,混搭风格,建材家居装修,装修效果图,iColor,立邦'
      when '0-0-0-0-0-0-0-0-117-0-0-0-0_0_0_0_0_0'
        '暖色调装修,温馨暖色调风格,装修风格,装修效果图,iColor,立邦'
      when '133-0-0-0-0-0-0-0-116-0-0-0-0_0_0_0_0_0'
        '冷色调装修,个性家居设计装修效果图,装修效果图,iColor,立邦'
      when '0-0-0-0-0-53-0-0-0-0-0-0-0_0_0_0_0_0'
        '古典装修效果图,古典风格,古典装修,家庭装修设计,装修效果图,iColor,立邦'
      when '0-0-292-83-0-0-0-0-0-0-0-0-0_0_0_0_0_0'
        '花架效果图,多彩艺术花架,装修设计,装修效果图,iColor,立邦'
      when '12-0-0-0-0-0-0-0-0-0-0-0-0_0_客厅_0_0_0'
        '跃层装修效果图,楼房装修效果图,家居装修,装修效果图,iColor,立邦'
      when '0-0-0-0-31-0-0-0-0-126-0-0-0_0_0_0_0_0'
        '120平米房子装修效果图,家居设计,两室两厅装修效果图,装修效果图,iColor,立邦'
      when '87-0-0-0-0-0-73-0-0-0-0-0-0_0_0_0_0_0'
        '书房装修效果图大全,书房装修效果图大全2013图片,iColor,立邦'
      when '0-0-0-0-0-0-0-0-0-126-0-0-0_0_0_0_0_0'
        '装修样板房效果图,室内装修设计,装修效果图,iColor,立邦'
      when '0-0-357-0-0-0-74-0-0-0-0-0-0_0_0_0_0_0'
        '踢脚线效果图,雅致,B,踢脚线装修图片,装修效果图,iColor,立邦'
      when '0-0-0-0-30-0-78-0-0-0-0-0-0_0_0_0_0_0'
        '90平方装修效果图,家居装饰,小户型装修效果图,装修设计,装修效果图,iColor,立邦 '
      when '0-0-0-0-0-35-0-0-108-0-0-0-0_0_0_0_0_0'
        '白色简约装修效果图,现代风格装修效果图,装修效果图,iColor,立邦 '
      when '18-0-0-0-0-0-0-0-0-0-0-0-0_0_0_0_0_0'
        'loft装修效果图,家居装修设计,装修效果图,iColor,立邦'
      else
        if @query_tags.present?
          @tag_bujian_helper + @tag_other_helper + "装修效果图,立邦icolor,立邦"
        else
          "立邦,立邦icolor,装修装饰,装修装潢设计,室内装修效果图大全,装修设计效果图,装修效果图大全2013图片,装修图片,装修风格"
        end
      end
    elsif controller_name == 'design_images' && action_name == 'image_show'
      case params[:id]
      when '108487'
        '厨房装修效果图大全2012图片,90平米小户型北欧小清新厨房,装修效果图,iColor,立邦'
      else
        "#{@image.title}装修图片,设计效果图,装修图库,#{@image.title}装修效果图,立邦,icolor"
      end
    #设计之星
    elsif controller_name == 'weekly_stars' && action_name == 'index'
      "明星设计师,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'weekly_stars' && action_name == 'show'
      "立邦iColor,立邦,家装设计,室内家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'weekly_stars' && %w{weekly_stars_week show}.include?(action_name)
      "明星设计师," + star_key
    elsif controller_name == 'weekly_stars' && action_name == 'weekly_stars_month_color'
      "明星色彩设计师," + star_key
    elsif controller_name == 'weekly_stars' && action_name == 'weekly_stars_month_design'
      "明星设计师," + star_key
    #个人主页(通用)
    elsif controller_name == 'users'
      "明星设计师,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #作品展示
    elsif controller_name == 'designs' && action_name == 'index'
      "装修设计,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'designs' && action_name == 'show'
      "立邦iColor,立邦,家装设计,室内家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #色彩搭配
    elsif controller_name == 'color_designs' && action_name == 'index'
      "色彩搭配,色彩装修案例,#{params[:design_style].present? ? params[:design_style] : '风格' },#{params[:design_color].present? ? params[:design_color] : '色系' },#{params[:design_usage].present? ? params[:design_usage] : '区域' },iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'color_designs' && action_name == 'show'
      "#{params[:design_style].present? ? params[:design_style] : '风格' },#{params[:design_color].present? ? params[:design_color] : '色系' },#{params[:design_usage].present? ? params[:design_usage] : '区域' },色彩搭配,室内家装设计,色彩装修设计案例,立邦iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #灵感秀
    elsif controller_name == 'inspirations' && action_name == 'index'
      inspirations_key
    elsif controller_name == 'inspirations' && action_name == 'inspirations_new'
      inspirations_key
    elsif controller_name == 'inspirations' && action_name == 'inspirations_hot'
      inspirations_key
    elsif controller_name == 'inspirations' && action_name == 'inspirations_minisite'
      "刷新21天," + inspirations_key
    elsif controller_name == 'inspirations' && action_name == 'show'
      "立邦iColor,立邦,家装设计,室内家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #业主通道
    elsif controller_name == 'channel' && action_name == 'refresh_service'
      "设计报名,设计推荐,装修公司,iColor,立邦,室内家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'channel'
      "设计报名,设计推荐,装修公司,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'faqs'
      "装修知识,家装知识,装修经验,家居装修,装修指导,室内装修知识,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'mix_colors'
      "配色方案,配色服务,配色咨询iColor,立邦,室内家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #行业资讯
    elsif controller_name == 'articles' && action_name == 'index'
      "装修资讯,专业家装资讯,色彩资讯,装修业内动态,装修行业资讯,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'articles' && action_name == 'show'
      "#{@article.title},装修资讯,专业家装资讯,装修行业资讯,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'color_articles' && action_name == 'index'
      "色彩资讯,装修资讯,专业家装资讯,装修行业资讯,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'master_topics' && action_name == 'index'
      "业内动态资讯,装修资讯,专业家装资讯,装修行业资讯,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'master_topics' && action_name == 'show'
      "业内动态资讯,装修资讯,专业家装资讯,色彩资讯,装修行业资讯,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #应用工具
    elsif controller_name == 'softwares' && action_name == 'case'
      "装修效果图下载,家装案例分享,iColor,立邦,室内家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'softwares' && action_name == 'tools'
      "配色方案,配色软件,家装配色软件,iColor,立邦,室内家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #漆光异彩
    elsif controller_name == 'function' && action_name == 'art'
      "MILANO米兰诺艺术漆,艺术漆效果图,微电影" + art_key
    elsif controller_name == 'function' && action_name == '7-1'
      "木纹漆,木纹效果图," + art_key
    #会员机制
    elsif controller_name == 'function' && action_name == 'rules'
      "立邦iColor会员机制,立邦,家装设计,装潢装修设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #网站声明
    elsif controller_name == 'function' && action_name == 'state'
      "立邦iColor,网站声明,立邦,家装设计,装潢装修设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #关于我们
    elsif controller_name == 'function' && action_name == 'about'
      "立邦iColor,立邦,家装设计,装潢装修设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #网站地图
    elsif controller_name == 'function' && action_name == 'sitemap'
      "立邦iColor网站地图,立邦,家装设计,装潢装修设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #精彩活动
    elsif controller_name == 'designer_events'
      "立邦icolor,iColor立邦活动,设计师活动,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'other_events'
      "立邦icolor,iColor立邦活动,设计师活动,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'gifts' && action_name == 'index'
      "立邦icolor,iColor立邦活动,设计师活动,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #联系我们
    elsif controller_name == 'contact'
      "立邦iColor,立邦,室内家装设计,装潢装修设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    else
      rescue_keyword
    end
  end
end