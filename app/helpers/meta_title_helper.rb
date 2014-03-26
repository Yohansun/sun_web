# encoding: utf-8
module MetaTitleHelper
  BASE_TITLE = "装修设计|如何装修|装修效果图大全2013图片  -  立邦iColor官方网站"
  NEW_BASE_TITLE = "怎么装修设计|室内装饰装潢设计|家装室内设计|装修设计效果图大全2013图片-立邦iColor官方网站"

  def page_title
      #对话名人
      if controller_path == 'dialog_celebrity/home' && controller_name == 'home'
        '对话名人,2014最新名家设计,名人问答和名人在线-立邦iColor官方网站'
      elsif controller_path == 'dialog_celebrity/master_profiles' && controller_name == 'master_profiles'
        if action_name == 'maste_interviews'
          "【名家设计】空间设计,色彩设计,园艺设计,对话名人-立邦iColor官方网站"
        elsif action_name == 'master_interview'
          "【大师访谈】" + @master.try(:name) + ",装修作品欣赏-立邦iColor官方网站"
        elsif action_name == 'celebrities'
          "【名人在线】名人介绍,名家手记,对话名人-立邦iColor官方网站"
        else
          "对话名人,2014最新名家设计,名人问答和名人在线-立邦iColor官方网站"
        end
      elsif controller_path == 'dialog_celebrity/celebrity_questions' && controller_name == 'celebrity_questions'
        "【名人问答】大师帮您解决装修中各种大小问题,对话名人-立邦iColor官方网站"
      elsif controller_path == 'dialog_celebrity/celebrity_notes' && controller_name == 'celebrity_notes'
        "【名家手记】名家畅谈装修知识,对话名人-立邦iColor官方网站"
      elsif controller_path == 'dialog_celebrity/editor_treasuries' && controller_name == 'editor_treasuries'
        "【小编宝典】名家设计作品推荐,对话名人-立邦iColor官方网站"
      elsif controller_path == 'dialog_celebrity/master_designs' && controller_name == 'master_designs'
        "【大师作品】" + @master.try(:master_field) + @master.try(:name) + "装修作品欣赏-立邦iColor官方网站"
      #首页
      elsif controller_name == 'home'
        "怎么装修设计|室内装饰装潢设计|家装室内设计|装修设计效果图大全2013图片_立邦iColor官方网站"
      #刷新生活
      elsif controller_name == 'refresh_record' && action_name == 'show'
        case params[:id]
        when "35"
          "立邦icolor刷新时尚新生活|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "34"
          "设计大师何肇娅|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "33"
          "2013年度iColor未来之星|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "32"
          "罗嘉良、苏岩幸福生活从这开始|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "31"
          "王丽坤|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "30"
          "赵国峰|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "29"
          "摄影名家姚铿|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "28"
          "黄雪清|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "27"
          "戴国军|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "26"
          "Quck论动物色彩配平衡学|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "25"
          "徐公伟畅谈神奇的水魅力|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "24"
          "刘锋|立邦icolor和您一起刷新家,新开始 -立邦iColor官方网站"
        when "23"
          "利旭恒|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "22"
          "李锐丁|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "21"
          "赖亚楠|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "20"
          "enrico的色彩魔术|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "19"
          "设计大师宋微建的色彩人生|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "18"
          "候正光|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "17"
          "高龙|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "16"
          "陈大瑞|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "15"
          "吴迪|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "14"
          "温淼|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "13"
          "王凤波|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "12"
          "刘利年|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "11"
          "杨明洁|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "10"
          "萧爱华|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "9"
          "王小根|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "8"
          "设计大师颜呈勋|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        when "7"
          "沈立东|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
        else
          "[#{@life_memoir.s_title}]｜ icolor和您一起刷新家，新开始 －   立邦iColor官方网站"
        end
      elsif controller_name == 'refresh_record'
        "刷新实录|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
      elsif controller_name == 'refresh_show'
        "刷新效果|立邦icolor和您一起刷新家,新开始-立邦iColor官方网站"
      elsif controller_name == 'refresh_list'
        "刷新生活精彩资讯｜icolor和您一起刷新家，新开始 －   立邦iColor官方网站"
      #大师访谈
      elsif controller_name == 'master_interviews' && params[:type] == 'shinei'
        if controller_name == 'master_interviews'
          "室内空间大师|大师访谈-大师殿堂-" + NEW_BASE_TITLE
        else
          "室内空间大师|大师作品-大师殿堂-" + NEW_BASE_TITLE
        end
      elsif %w{master_interviews master_designs}.include?(controller_name) && params[:type] == 'color'
        if controller_name == 'master_interviews'
          "色彩大师|大师访谈-大师殿堂-" + NEW_BASE_TITLE
        else
          "色彩大师|大师作品-大师殿堂-" + NEW_BASE_TITLE
        end
      elsif controller_name == 'master_interviews' && %w{index all}.include?(action_name)
        "#{'全部 |' if action_name == 'all'}大师访谈-大师殿堂-" + NEW_BASE_TITLE
      elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'oversea'
        if controller_name == "master_interviews"
          "海外|大师访谈-大师殿堂-" + NEW_BASE_TITLE
        else
          "海外|大师作品-大师殿堂-" + NEW_BASE_TITLE
        end
      elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'hk_tw_mc'
        if controller_name == 'master_interviews'
          "港澳台|大师访谈-大师殿堂-" + NEW_BASE_TITLE
        else
          "港澳台|大师作品-大师殿堂-" + NEW_BASE_TITLE
        end
      elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'cn'
        if controller_name == 'master_interviews'
          "中国大陆|大师访谈-大师殿堂-" + NEW_BASE_TITLE
        else
          "中国大陆|大师作品-大师殿堂-" + NEW_BASE_TITLE
        end
      elsif controller_name == 'master_interviews' && action_name == 'show'
        "立邦iColor设计大师-#{@article.name}-简介、访谈、作品、寄语-立邦iColor官方网站"
      #大师作品
      elsif controller_name == 'master_designs' && %w{index all}.include?(action_name)
        "【#{'全部 |' if action_name == 'all'} 大师作品】- 大师殿堂" + '-' + BASE_TITLE
      elsif controller_name == 'master_designs' && action_name == 'show'
        "【#{@master_design.design_name} | #{@master_design.master_profile.try(:name) || @master_design.master_name}】- 室内空间大师" + '-' + BASE_TITLE
      #装修图库
      elsif controller_name == 'design_images' && action_name == 'lists'
        "图库精华|拥有最新最热装修效果图-立邦iColor官方网站"
      elsif controller_name == 'design_images' && action_name == 'index'
        render_design_images_index
      elsif controller_name == 'design_images' && action_name == 'image_show'
        case params[:id]
        when '108487'
          '90平米小户型北欧小清新厨房装修效果图大全2012图片装修图片_立邦 iColor官方网站'
        else
          "#{@image.title}装修图片-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
        end
      elsif controller_name == 'design_images' && action_name == 'fullscreen'
        "【#{@design_name}】大图  【#{@author}】 -  立邦icolor"
      #设计之星
      elsif controller_name == 'weekly_stars' && action_name == 'index'
        "立邦icolor设计之星"
      elsif controller_name == 'weekly_stars' && action_name == 'show'
        "#{@design_name}|#{@author}-立邦icolor设计之星"
      elsif controller_name == 'weekly_stars' && action_name == 'weekly_stars_week'
        str = ""
        if @design_name.present?
          str += "【#{@design_name}】"
        end
        if @company_name.present?
          str += "【#{@company_name}】"
        end
        if @author.present?
          str += "【#{@author}】"
        end
        if @design_name.blank? && @company_name.blank? && @author.blank?
          "立邦icolor设计之星"
        else
          str +=" - 立邦icolor设计之星"
        end
      elsif controller_name == 'weekly_stars' && action_name == 'weekly_stars_month_color'
        "【月度色彩之星 | 设计之星】- 设计鉴赏" + '-' + BASE_TITLE
      elsif controller_name == 'weekly_stars' && action_name == 'weekly_stars_month_design'
        "【月度设计之星 | 设计之星】- 设计鉴赏" + '-' + BASE_TITLE
      #个人主页(通用)
      elsif controller_name == 'users'
        "【iColor设计师-#{current_user.display_name}】- 个人主页" + '-' + BASE_TITLE
      #作品展示
      elsif controller_name == 'designs' && action_name == 'index'
        "作品展示|设计鉴赏-" + NEW_BASE_TITLE
      elsif controller_name == 'designs' && action_name == 'show'
        "#{@design.user.display_name}|#{@design.title}-设计鉴赏-立邦iColor官方网站"
      #幻灯片
      elsif controller_name == 'designs' && action_name == 'fullscreen'
        "【#{@design_name}】大图  【#{@author}】 -  立邦icolor"
      #色彩搭配
      elsif controller_name == 'color_designs' && action_name == 'index'
        "色彩搭配|设计鉴赏-" + NEW_BASE_TITLE
      elsif controller_name == 'color_designs' && action_name == 'show'
        "#{@design.design_style}|#{@design.design_color}|#{@design.design_usage}|色彩搭配-设计鉴赏-立邦iColor官方网站"
      #灵感秀
      elsif controller_name == 'inspirations' && action_name == 'index'
        "灵感秀|设计鉴赏-" + NEW_BASE_TITLE
      elsif controller_name == 'inspirations' && action_name == 'inspirations_new'
        "最新|灵感秀-设计鉴赏-" + NEW_BASE_TITLE
      elsif controller_name == 'inspirations' && action_name == 'inspirations_hot'
        "最热|灵感秀-设计鉴赏-" + NEW_BASE_TITLE
      elsif controller_name == 'inspirations' && action_name == 'inspirations_minisite'
        "刷新21天|灵感秀-设计鉴赏-" + NEW_BASE_TITLE
      elsif controller_name == 'inspirations' && action_name == 'show'
        "#{@inspiration.title}|灵感秀设计鉴赏-立邦iColor官方网站"
      #业主通道
      elsif controller_name == 'channel' && action_name == 'refresh_service'
        "刷新服务|icolor和您一起刷新家，新开始-立邦iColor官方网站"
      elsif controller_name == 'channel'
        "设计快查|装修公司免费推荐-立邦iColor官方网站"
      elsif controller_name == 'faqs'
        "装修问答|业主通道-立邦iColor官方网站"
      elsif controller_name == 'mix_colors'
        "配色咨询|业主通道-立邦iColor官方网站"
      #行业资讯
      elsif controller_name == 'articles' && action_name == 'index'
        "装修资讯-行业资讯-" + NEW_BASE_TITLE
      elsif controller_name == 'articles' && action_name == 'show'
        @article.title + "|装修资讯-立邦iColor官方网站"
      elsif controller_name == 'color_articles' && action_name == 'index'
        "色彩资讯-行业资讯-" + NEW_BASE_TITLE
      elsif controller_name == 'master_topics' && action_name == 'index'
        "业内动态-行业资讯-" + NEW_BASE_TITLE
      elsif controller_name == 'master_topics' && action_name == 'show'
        "#{@topic.title}|业内动态-立邦iColor官方网站"
      #应用工具
      elsif controller_name == 'softwares' && action_name == 'case'
        "色彩案例搭配|案例下载-应用工具-" + NEW_BASE_TITLE
      elsif controller_name == 'softwares' && action_name == 'tools'
        "在线配色软件|配色软件-应用工具-" + NEW_BASE_TITLE
      #漆光异彩
      elsif controller_name == 'function' && action_name == 'art'
        "【MILANO米兰诺艺术效果】- 漆光异彩" + '-' + BASE_TITLE
      elsif controller_name == 'function' && action_name == '7-1'
        "【木纹风尚生活】- 漆光异彩" + '-' + BASE_TITLE
      #会员机制
      elsif controller_name == 'function' && action_name == 'rules'
        "会员机制|送积分享权益-立邦iColor官方网站"
      #网站声明
      elsif controller_name == 'function' && action_name == 'state'
        "立邦icolor网站声明-立邦iColor官方网站"
      #关于我们
      elsif controller_name == 'function' && action_name == 'about'
        "关于我们|立邦icolor家装设计-立邦iColor官方网站"
      #网站地图
      elsif controller_name == 'function' && action_name == 'sitemap'
        "立邦icolor网站地图-立邦iColor官方网站"
      #精彩活动
      elsif controller_name == 'designer_events'
        "设计师活动-精彩活动-" + NEW_BASE_TITLE
      elsif controller_name == 'other_events'
        "其他活动-精彩活动-" + NEW_BASE_TITLE
      elsif controller_name == 'gifts' && action_name == 'index'
        "获奖名单-精彩活动-" + NEW_BASE_TITLE
      #联系我们
      elsif controller_name == 'contact'
        "联系我们|全心全意为您服务-立邦iColor官方网站"
      else
        BASE_TITLE
      end
    rescue
      BASE_TITLE
  end

  def render_design_images_index
    case params[:path]
    when '0-0-359-0-0-0-0-0-0-126-0-0-0_0_0_0_0_0'
      'liugangiColor官方网站'
    when '0-0-0-0-0-0-72-0-0-125-0-0-0_0_0_0_0_0'
      '出租房装修,123123装修设计,实用,装修效果图_立邦 iColor官方网站'
    when '0-0-0-0-0-56-0-0-0-0-0-0-0_0_0_0_0_0'
      '波西米亚装修风格,波西米亚家居设计,装修效果图_立邦 iColor官方网站'
    when '13-0-0-89-0-0-0-0-0-0-0-0-0_0_0_0_0_0'
      '露台装修,阳台装修效果图_立邦 iColor官方网站'
    when '0-0-0-0-0-38-0-0-0-0-0-0-0_0_0_0_0_0'
      '混搭装修,混搭风格新风潮,建材家居装修,装修效果图_立邦 iColor官方网站'
    when '0-0-0-0-0-0-0-0-117-0-0-0-0_0_0_0_0_0'
      '温馨暖色调,装修设计风格效果图_立邦 iColor官方网站'
    when '133-0-0-0-0-0-0-0-116-0-0-0-0_0_0_0_0_0'
      '冷色调,装修效果图,个性家居设计,实景图_立邦 iColor官方网站'
    when '0-0-0-0-0-53-0-0-0-0-0-0-0_0_0_0_0_0'
      '古典,装修效果图,古典风格装修,家庭装修设计_立邦 iColor官方网站'
    when '0-0-292-83-0-0-0-0-0-0-0-0-0_0_0_0_0_0'
      '花架效果图,花架装修设计效果图,多彩艺术花架_立邦 iColor官方网站'
    when '12-0-0-0-0-0-0-0-0-0-0-0-0_0_客厅_0_0_0'
      '跃层,R装修效果图,家居装修,楼房装修效果图_立邦 iColor官方网站'
    when '0-0-0-0-31-0-0-0-0-126-0-0-0_0_0_0_0_0'
      '样板房装修,90-120平米房子装修效果图,家居设计,两室两厅装修效果图_立邦 iColor官方网站'
    when '87-0-0-0-0-0-73-0-0-0-0-0-0_0_0_0_0_0'
      '书房装修效果图大全2013图片, 书房装修设计_立邦 iColor官方网站'
    when '0-0-0-0-0-0-0-0-0-126-0-0-0_0_0_0_0_0'
      '样板房装修,装修效果图,室内装修设计,中西融合_立邦 iColor官方网站'
    when '0-0-357-0-0-0-74-0-0-0-0-0-0_0_0_0_0_0'
      '踢脚线装修效果图,雅致格调,踢脚线装修设计效果图_立邦 iColor官方网站'
    when '0-0-0-0-30-0-78-0-0-0-0-0-0_0_0_0_0_0'
      '前卫,70-90平米装修效果图,小户型装修设计效果图,家居装饰_立邦 iColor官方网站'
    when '0-0-0-0-0-35-0-0-108-0-0-0-0_0_0_0_0_0'
      '浅白色系,现代简约,装修效果图,现代风格装修效果图_立邦 iColor官方网站'
    when '18-0-0-0-0-0-0-0-0-0-0-0-0_0_0_0_0_0'
      'LOFT,装修效果图,艺术创新,家居装修设计_立邦 iColor官方网站'
    else
      if @query_tags.present?
        @tag_bujian_helper + @tag_other_helper + "装修效果图-立邦icolor官方网站"
      else
        "装修效果图大全最新2013、2013年室内装修装潢设计效果图大全、家庭装修设计效果图 -立邦iColor 装修设计鉴赏、设计大师作品欣赏、访谈"
      end
    end
  end

end