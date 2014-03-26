# encoding: utf-8
module MetaDescriptionHelper
  def des_content
    star_descript1 = "立邦iColor装修设计鉴赏带您领略iColor"
    star_descript2 = "设计师装修设计作品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    channel_descript = "填写申请表后，立邦iColor为您免费推荐3家同城优秀家装公司。浏览2013装修效果图大全、欣赏设计师独家作品、搜索全国热门装修公司，就在立邦icolor。"
    article_desctipt = "立邦iColor装修设计鉴赏涵盖丰富、专业的装家具修行业资讯,包括：色彩资讯、业内动态供您参阅,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    designer_events_descript = "立邦iColor装修设计鉴赏将定期举办精彩活动,并邀设计师参加活动,成为设计师展现家居装修设计风采专业平台.还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    rescue_desc = "立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."

    #对话名人
    if controller_path == 'dialog_celebrity/home' && controller_name == 'home'
      "立邦iColor对话名人频道提供最新最全的名人在线问答,直面大师专家,为您在线授道解惑,还包括名家精选设计作品欣赏。"
    elsif controller_path == 'dialog_celebrity/master_profiles' && controller_name == 'master_profiles'
      if action_name == 'maste_interviews'
        "名家设计所在地区包括海外,港澳台和大陆,从事领域有空间设计,色彩设计,软装设计,园艺设计和装修施工等作品在线欣赏。"
      elsif action_name == 'master_interview'
        "这里有关于" + @master.try(:name) + "的访谈肉容和经典装修作品欣赏。"
      elsif action_name == 'celebrities'
        "名人在线提供所有名人的相关介绍和名家关于装修方面的手机,让您与名家零距离接触。"
      else
        "立邦iColor对话名人频道提供最新最全的名人在线问答,直面大师专家,为您在线授道解惑,还包括名家精选设计作品欣赏。"
      end
    elsif controller_path == 'dialog_celebrity/celebrity_questions' && controller_name == 'celebrity_questions'
      "名人问答频道为您解决装修中如水电,墙面,布线,油漆,防漏等各种装修施工中碰到的大小问题。"
    elsif controller_path == 'dialog_celebrity/celebrity_notes' && controller_name == 'celebrity_notes'
      "名家手记为广大需要装修的人提供在线帮助,在此您可以学到各种关于装修方面的宝贵知识。"
    elsif controller_path == 'dialog_celebrity/editor_treasuries' && controller_name == 'editor_treasuries'
      "小编宝典为您推荐最新最经典名家设计作品在线欣赏"
    elsif controller_path == 'dialog_celebrity/master_designs' && controller_name == 'master_designs'
      "有关" + @master.try(:master_field) + "#{@master.try(:name)}装修作品欣赏"
    #首页
    elsif  controller_name == 'home'
      "立邦iColor轻松教您怎么装修设计,如何设计装修房子,立邦iColor室内装潢装饰设计,鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多室内家装设计灵感以及专业的设计装修资讯,更有家装室内设计专业实用工具,满足你的色彩家装需求,还有更多精彩装修设计效果图,以及设计装修案例、灵感家装设计图片尽在立邦iColor官方网站."
    #刷新生活
    elsif controller_name == 'refresh_record' && action_name == 'show'
      case params[:id]
      when "37"
        "立邦iColor轻松教您怎么装修设计,和您一起刷新时尚,立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修装饰灵感以及专业的怎么装修装潢资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "34"
        "立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师何肇娅设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "33"
        "立邦icolor装修设计详细介绍2013年度iColor未来之星,立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "32"
        "立邦iColor刷新罗嘉良、苏岩幸福生活.立邦icolor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "31"
        "立邦icolor为您重点介绍王丽坤,“素颜女神”的素颜卧室.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "30"
        "立邦icolor为您重点介绍立邦回归自然的生活本质赵国峰.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "29"
        "立邦icolor带您进入摄影名家姚铿的色彩之家.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "28"
        "立邦icolor为您重点介绍相恋大地之色的黄雪清.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "27"
        "立邦icolor为您重点介绍品原味自然色的戴国军.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "26"
        "立邦icolor为您重点介绍Quck论动物色彩配平衡学.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "25"
        "立邦icolor为您重点介绍徐公伟畅谈神奇的水魅力.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "24"
        "立邦icolor为您重点介绍刘锋刘锋聊水,透明映照丰富世界.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "23"
        "立邦icolor为您重点介绍利旭恒奉水为生命的奇端.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "22"
        "立邦icolor为您重点介绍李锐丁.李锐丁称色彩是上帝赋予人类最美丽的礼物]立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "21"
        "立邦icolor为您重点介绍赖亚楠.赖亚楠拥有笔下最美的自然界色彩.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "20"
        "立邦icolor邀您一同观看enrico的色彩魔术.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "19"
        "立邦icolor为您重点介绍设计大师宋微建的色彩人生.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "18"
        "立邦icolor为您重点介绍候正光.体会候正光有感设计包容万物.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "17"
        "立邦iColor和你一起与设计名家高龙观细微悟人生.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "16"
        "立邦iColor与陈大瑞一同生活在气中思考享受.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "15"
        "立邦iColor和你一起听吴迪的色彩语言与源源不断的生命力.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "14"
        "立邦iColor带你一起见证温淼力挺80后主视觉.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "13"
        "立邦iColor与你分享王凤波至爱凤凰的那火一样的颜色.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "12"
        "立邦iColor为你介绍刘利年为什么有感红色系.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "11"
        "立邦iColor与你一起和杨明洁共同品味永恒白 .立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "10"
        "立邦iColor和你一起领略萧爱华眼中的设计无所不在.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "9"
        "立邦iColor与你一起听王小根描绘风一样自由变化的颜色.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      when "8"
        "立邦iColor与你随着设计大师颜呈勋一起感悟颜色季节.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站"
      when "7"
        "立邦iColor与你品位沈立东笑谈轻舞风飞的人生.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
      else
        rescue_desc
      end
    elsif controller_name == 'refresh_record'
      "立邦iColor刷新实录,提供最新热门视频,让您更切实具体了解立邦icolor装修设计.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修装饰灵感以及专业的怎么装修装潢资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'refresh_show'
      "立邦iColor刷新效果.刷新出您多姿多彩的生活.立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修装饰灵感以及专业的怎么装修装潢资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'refresh_list'
      rescue_desc
    #大师访谈
    elsif %w{master_interviews master_designs}.include?(controller_name) && params[:type] == 'shinei'
      "立邦iColor装修装潢设计鉴赏带您欣赏顶级的国际、港澳台、国内知名室内空间设计大师装修设计作品,还有更多精彩家居装修设计效果图,以及设计装修案例、灵感家装设计效果图片尽在立邦iColor官方网站"
    elsif %w{master_interviews master_designs}.include?(controller_name) && params[:type] == 'color'
      "立邦iColor装修装潢设计鉴赏带您欣赏顶级的国际、港澳台、国内知名色彩设计大师装修设计作品,还有更多精彩家居装修设计效果图,以及设计装修案例、灵感家装设计效果图片尽在立邦iColor官方网站."
    elsif controller_name == 'master_interviews' && %w{index all}.include?(action_name)
      "立邦iColor装修装潢设计鉴赏带您领略顶级的国际、港澳台、国内知名设计大师,通过立邦iColor设计师访谈欣赏设计大师所完成的经典国际家居设计精品,还有更多精彩家居装修设计效果图,以及设计装修案例、灵感家装设计效果图片尽在立邦iColor官方网站."
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'oversea'
      "立邦iColor装修装潢设计鉴赏带您领略顶级的国际、海外知名设计大师,通过立邦iColor设计师访欣赏略设计大师所完成的经典国际家居设计精品,还有更多精彩家居装修设计效果图,以及设计装修案例、灵感家装设计效果图片尽在立邦iColor官方网站"
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'hk_tw_mc'
      "立邦iColor装修装潢设计鉴赏带您领略顶级的港澳台地区知名设计大师,通过立邦iColor设计师访谈欣赏设计大师所完成的经典国际家居设计精品,还有更多精彩家居装修设计效果图,以及设计装修案例、灵感家装设计效果图片尽在立邦iColor官方网站."
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'cn'
      "立邦iColor装修装潢设计鉴赏带您领略顶级国内知名设计大师,通过立邦iColor设计师访谈欣赏设计大师所完成的经典国际家居设计精品,还有更多精彩家居装修设计效果图,以及设计装修案例、灵感家装设计效果图片尽在立邦iColor官方网站."
    elsif controller_name == 'master_interviews' && action_name == 'show'
      "立邦 iColor顶级,国际、港澳台、国内知名设计大师-#{@article.name},简介,设计大师作品,还有更多精彩家居装修设计效果图,以及设计装修案例、灵感家装设计效果图片尽在立邦iColor官方网站."
    #大师作品
    elsif controller_name == 'master_designs' && %w{index all}.include?(action_name)
      "立邦iColor装修设计鉴赏带您欣赏顶级的国际、港澳台、国内知名室内空间设计大师以及色彩设计大师装修设计作品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'master_designs' && action_name == 'show'
      "立邦iColor装修设计鉴赏带您欣赏顶级的【国际、港澳台、国内知名色彩设计大师、室内空间设计大师】#{@master_design.design_name},#{@master_design.master_profile.try(:name) || @master_design.master_name},还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    #装修图库
    elsif controller_name == 'design_images' && action_name == 'lists'
      "立邦iColor为您提供最新最热,包括最受欢迎,值得推荐的装修效果图,便于快捷找到满足自己的个性化需求的家装设计效果图.更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'design_images' && action_name == 'index'
      case params[:path]
      when '0-0-359-0-0-0-0-0-0-126-0-0-0_0_0_0_0_0'
        '立邦iColor拥有罗马柱装修图库,方便您设计自己的罗马柱装修效果图,各式各样欧式古典风格装修,精心挑选样板房装修,B2013装修图片大全,满足您的个性化装修需求,各种装修罗马柱效果图尽在立邦iColor官方网站'
      when '0-0-0-0-0-0-72-0-0-125-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,精心挑选出租房装修,有很多出租房装修案例,实用2013装修图片大全,方便您设计自己的装修效果图,满足您的个性化装修需求,多样式出租房装修设计效果图尽在立邦iColor官方网站'
      when '0-0-0-0-0-56-0-0-0-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,包含多款波西米亚装修风格,精心挑选波西米亚家居2013装修风格图片大全,方便您设计自己的装修效果图,满足您的个性化装修需求,更多波西米亚装修风格效果图尽在立邦iColor官方网站'
      when '13-0-0-89-0-0-0-0-0-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,精心挑选阳台装修,露台装修图片大全,方便您设计自己的家居阳台,露台装修设计效果图,满足您的个性化阳台装修设计需求,更多露台装修,阳台装修设计效果图尽在立邦iColor官方网站'
      when '0-0-0-0-0-38-0-0-0-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,精心挑选混搭风格装修新风潮,建材家居装修,F2013装修图片大全,方便您设计自己的混搭装修效果图,满足您的个性化混搭装修需求,更多混搭风格装修设计效果图尽在立邦iColor官方网站'
      when '0-0-0-0-0-0-0-0-117-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,精心挑选2013暖色调装修图片大全,方便您设计自己的暖色调风格装修效果图,满足您的个性化暖色调装修需求,更多暖色调装修设计效果图尽在立邦iColor官方网站'
      when '133-0-0-0-0-0-0-0-116-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,精心挑选2013冷色调装修图片大全,方便您设计自己的实景图装修效果图,满足您的个性化冷色调家居装修需求,更多冷色调家居装修设计效果图尽在立邦iColor官方网站'
      when '0-0-0-0-0-53-0-0-0-0-0-0-0_0_0_0_0_0'
        '立邦 iColor古典装修效果图库,精心挑选2013古典装修图片大全,包含多样式古典装修效果图,带给您家居装修上的灵感,方便您设计自己的家居装修效果图,满足您的个性化装修需求,更多古典装修效果图尽在立邦iColor官方网站'
      when '0-0-292-83-0-0-0-0-0-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,包含多样式花架效果图,精心挑选H2013装修图片大全,方便您设计自己的花架装修效果图,满足您的个性化家居装修需求,更多花架效果图尽在立邦iColor官方网站'
      when '12-0-0-0-0-0-0-0-0-0-0-0-0_0_客厅_0_0_0'
        '立邦 iColor装修图库,包含多样式跃层装修效果图,精心挑选跃层,R2013装修图片大全,方便您设计自己的跃层装修效果图,满足您的个性化装修需求,更多跃层装修效果图尽在立邦iColor官方网站'
      when '0-0-0-0-31-0-0-0-0-126-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,精心挑选2013年90-120平米房子装修,样板房装修图片大全,方便您设计自己的120平米房子装修效果图,满足您的个性化装修需求,更多120平米房子装修效果图尽在立邦iColor官方网站'
      when '87-0-0-0-0-0-73-0-0-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,包含多种书房装修效果图大全,精心挑选书房装修效果图大全2013图片,方便您设计自己的书房装修效果图,满足您的个性化装修需求,更多书房装修效果图尽在立邦iColor官方网站'
      when '0-0-0-0-0-0-0-0-0-126-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,包含多种装修样板房效果图,精心挑选样板房装修2013装修图片大全,方便您设计自己的装修效果图,满足您的个性化装修需求,更多装修样板房效果图尽在立邦iColor官方网站'
      when '0-0-357-0-0-0-74-0-0-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,包含多种踢脚线效果图,精心挑选雅致,B2013装修图片大全,方便您设计自己的踢脚线装修效果图,满足您的个性化装修需求,更多踢脚线效果图尽在立邦iColor官方网站'
      when '0-0-0-0-30-0-78-0-0-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,包含各种90平方装修效果图,精心挑选前卫,70-90平米2013装修图片大全,方便您设计自己的90平方装修效果图,满足您的个性化装修需求,更多90平方装修效果图尽在立邦iColor官方网站'
      when '0-0-0-0-0-35-0-0-108-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,包含各种白色简约装修效果图,精心挑选浅白色系,现代简约,F2013装修图片大全,方便您设计自己的白色简约装修效果图,满足您的个性化装修需求,更多白色简约装修效果图尽在立邦iColor官方网站'
      when '18-0-0-0-0-0-0-0-0-0-0-0-0_0_0_0_0_0'
        '立邦 iColor装修图库,包含各种loft装修效果图,精心挑选LOFT2013装修图片大全,方便您设计自己的loft装修效果图,满足您的个性化装修需求,更多loft装修效果图尽在立邦iColor官方网站'
      else
        if @query_tags.present?
          "立邦iColor装修设计图库,精心挑选" + @tag_bujian_helper + @tag_other_helper + "装修效果图大全2013图片,方便您设计自己的" + @tag_bujian.join + "装修效果图,满足您的个性化装修需求,更多装修效果图尽在立邦icolor官方网站"
        else
          "立邦 iColor装修设计图库,提供近6万张最流行的装修效果图大全2013图片、室内装修装潢设计效果图大全欣赏、装修风格鉴赏,展示丰富的客厅、厨房、卫生间、卧室、阳台等各种分类装修效果图,满足您的一切装修设计需求,更多室内家装设计效果图尽在立邦icolor官方网站"
        end
      end
    elsif controller_name == 'design_images' && action_name == 'image_show'
      case params[:id]
      when '108487'
        '立邦 iColor 装修图库装修效果图专区,包含多种厨房装修效果图大全2012图片,提供2013年国内外最新的90平米小户型北欧小清新厨房装修效果图大全2012图片装修图片,设计效果图,是目前更新速度最快、最经典的装修效果图案例,更多厨房装修效果图,灵感家装图片尽在立邦iColor官方网站'
      else
        "立邦 iColor装修图库#{@image.title}专区,提供2013年国内外最新的#{@image.title}装修图片,#{@image.title}装修设计效果图,是目前更新速度最快、最经典的装修效果图案例.更多#{@image.title}装修效果图尽在立邦icolor官方网站"
      end
    #设计之星
    elsif controller_name == 'weekly_stars' && action_name == 'index'
      "立邦iColor装修设计鉴赏带您领略iColor【每周之星】设计师装修设计作品,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'weekly_stars' && action_name == 'show'
      "立邦iColor设计之星#{@author},主题#{@design_name},给您带来别样装修设计理念.更多精彩装修效果图,以及室内设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'weekly_stars' && action_name == 'weekly_stars_week'
      star_descript1 + '【每周之星】' + star_descript2
    elsif controller_name == 'weekly_stars' && action_name == 'weekly_stars_month_color'
      star_descript1 + '【月度色彩之星】' + star_descript2
    elsif controller_name == 'weekly_stars' && action_name == 'weekly_stars_month_design'
      star_descript1 + '【月度设计之星】' + star_descript2
    #个人主页(通用)
    elsif controller_name == 'users'
      "立邦iColor明星设计师 — 设计师姓名的个人主页为您展示装修设计作品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    #作品展示
    elsif controller_name == 'designs' && action_name == 'index'
      "立邦iColor装修设计鉴赏带您领略优秀的立邦iColor设计师专业装修设计作品,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站"
    elsif controller_name == 'designs' && action_name == 'show'
      "立邦iColor设计师#{@design.user.display_name},作品#{@design.title},给您带来别样装修设计理念.还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #色彩搭配
    elsif controller_name == 'color_designs' && action_name == 'index'
      "立邦iColor装修设计鉴赏带您领略色彩搭配装修效果图,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'color_designs' && action_name == 'show'
      "立邦iColor装修设计鉴赏带您在#{params[:design_usage]}区域领略别样的#{params[:design_style]}风格,同时呈现#{params[:design_color]},各种色彩搭配装修效果图,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #灵感秀
    elsif controller_name == 'inspirations' && action_name == 'index'
      "立邦iColor装修设计鉴赏灵感秀充满了最新、最热的灵感图片,帮您寻找装修设计灵感元素,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'inspirations' && action_name == 'inspirations_new'
      "立邦iColor装修设计鉴赏灵感秀充满了最新灵感图片,帮您寻找装修设计灵感元素,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'inspirations' && action_name == 'inspirations_hot'
      "立邦iColor装修设计鉴赏灵感秀充满了最热灵感图片,帮您寻找装修设计灵感元素,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站"
    elsif controller_name == 'inspirations' && action_name == 'inspirations_minisite'
      "立邦iColor装修设计鉴赏刷新21天活动,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'inspirations' && action_name == 'show'
      "立邦icolor装修设计给予你#{@inspiration.title}的灵感来源,助于设计自己个性化家居理念.立邦iColor装修设计鉴赏灵感秀名称,为你带来更多装修装潢设计灵感以及专业的家装设计资讯,更有家装专业实用工具,满足你的灵感家装需求,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #业主通道
    elsif controller_name == 'channel' && action_name == 'refresh_service'
      "立邦icolor专业涂刷服务！立邦icolor帮您搬移及保护家具，全程不用您动手，只需短短几天，即可实现焕然一新的家.填写申请表后，立邦iColor为您免费推荐3家同城优秀家装公司。浏览2013装修效果图大全、欣赏设计师独家作品、搜索全国热门装修公司，就在立邦iColor官方网站."
    elsif controller_name == 'channel'
      "立邦icolor设计快查,最高效的服务您.填写申请表后,立邦iColor为您免费推荐3家同城优秀家装公司。浏览2013装修效果图大全、欣赏设计师独家作品、搜索全国热门装修公司,就在立邦iColor官方网站."
    elsif controller_name == 'faqs'
      "立邦icolor全方位为您解决装修烦恼,解答各种疑难问题.写申请表后,立邦iColor为您免费推荐3家同城优秀家装公司。浏览2013装修效果图大全、欣赏设计师独家作品、搜索全国热门装修公司,就在立邦iColor官方网站."
    elsif controller_name == 'mix_colors'
      "根据您的个人喜好和风格，为您配上个性化色彩。立邦iColor装修设计鉴赏为您提供配色资讯服务,还有更多精彩装修设计效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #行业资讯
    elsif controller_name == 'articles' && action_name == 'index'
      "立邦icolor装修资讯,提供最新最丰富装修资讯供您参考学习.立邦iColor装修设计鉴赏涵盖丰富、专业的装家具修行业资讯,包括：色彩资讯、业内动态供您参阅,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'articles' && action_name == 'show'
      "立邦icolor带您进入全新#{@article.title}.立邦iColor装修设计鉴赏涵盖丰富、专业的装家具修行业资讯,包括：色彩资讯、业内动态供您参阅,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'color_articles' && action_name == 'index'
      "立邦icolor色彩资讯,提供最丰富最唯美色彩资讯供您参考.立邦iColor装修设计鉴赏涵盖丰富、专业的装家具修行业资讯,包括：色彩资讯、业内动态供您参阅,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'master_topics' && action_name == 'index'
      "立邦icolor业内资讯,便于了解立邦icolor最新动态活动.立邦iColor装修设计鉴赏涵盖丰富、专业的装家具修行业资讯,包括：色彩资讯、业内动态供您参阅,还有更多精彩装修设计效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'master_topics' && action_name == 'show'
      "立邦icolor给您带来#{@topic.title}业内资讯.立邦iColor装修设计鉴赏涵盖丰富、专业的装家具修行业资讯,包括：色彩资讯、业内动态供您参阅,还有更多精彩装修效果图,以及室内家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #应用工具
    elsif controller_name == 'softwares' && action_name == 'case'
      "立邦iColor装修装潢设计鉴赏为您提供专业色彩案例搭配供您下载,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'softwares' && action_name == 'tools'
      "立邦iColor装修装潢设计鉴赏为您提供专业的在线配色软件应用,更加方便、快速生成符合您装修设计的配色方案,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #漆光异彩
    elsif controller_name == 'function' && action_name == 'art'
      "立邦iColor装修设计鉴赏带您欣赏MILANO米兰诺艺术漆,刷出漆光异彩,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'function' && action_name == '7-1'
      "立邦iColor装修设计鉴赏带您欣赏木纹风尚生活,刷新美木纹生活新风尚,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    #会员机制
    elsif controller_name == 'function' && action_name == 'rules'
      "立邦iColor会员机制更多积分等您拿，拥有比普通会员更多权益，浏览下载设计师优秀作品，享受立邦icolor新产品等等。更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #网站声明
    elsif controller_name == 'function' && action_name == 'state'
      "立邦iColor网站声明,使用立邦涂料（中国）有限公司网站.更多精彩装修效果图,以及家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #关于我们
    elsif controller_name == 'function' && action_name == 'about'
      "立邦iColor拥有包括设计鉴赏、大师殿堂、行业资讯、精彩活动、业主通道、漆光艺彩等热门板块.立邦iColor作为一个全公益性服务网站,为家装公司及设计师提供免费发布优秀作品的机会、提供海内外装修及色彩界的大师作品、所有海量案例和色彩工具的免费下载，并协助提升知名度、积聚粉丝、同行业互通交流的服务.更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #网站地图
    elsif controller_name == 'function' && action_name == 'sitemap'
      "立邦iColor为广大消费者提供了网站地图，让您更快更准的找到您想要了解的立邦icolor相关信息。更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #精彩活动
    elsif controller_name == 'designer_events'
      "立邦iColor装修设计鉴赏将定期举办精彩活动,并邀设计师参加活动,成为设计师展现家居装修设计风采专业平台.还有更多精彩装修效果图,以及家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'other_events'
      "立邦iColor装修设计鉴赏将定期举办精彩活动,并邀设计师参加活动,成为设计师展现家居装修设计风采专业平台.还有更多精彩装修效果图,以及家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    elsif controller_name == 'gifts' && action_name == 'index'
      "立邦iColor装修设计鉴赏刷新生活21天,并邀设计师参加活动,成为设计师展现家居装修设计风采专业平台.还有更多精彩装修效果图,以及家装设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #联系我们
    elsif controller_name == 'contact'
      "立邦iColor真诚为您服务,为广大消费者提供各式装修案例和色彩灵感，设有快速通道寻找自己心仪的优秀作品和家装公司、并提供转发评论投票、实时联络家装公司及设计师、美图实时上传分享的服务。更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    else
      rescue_desc
    end
  end
end