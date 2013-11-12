#encoding: utf-8
module ApplicationHelper

  BASE_TITLE = "装修设计|如何装修|装修效果图大全2013图片  -  立邦iColor官方网站"

  def page_title
        #首页
        if  controller_name == 'home'
          "怎么装修设计|室内装饰装潢设计|家装室内设计|装修设计效果图大全2013图片_立邦iColor官方网站"
        #大师访谈
        elsif controller_name == 'master_interviews' && params[:type] == 'shinei'
          if controller_name == 'master_interviews'
            "【室内空间大师 | 大师访谈】- 大师殿堂" + '-' + BASE_TITLE
          else
            "【室内空间大师 | 大师作品】- 大师殿堂" + '-' + BASE_TITLE
          end
        elsif %w{master_interviews master_designs}.include?(controller_name) && params[:type] == 'color'
          if controller_name == 'master_interviews'
            "【色彩大师 | 大师访谈】- 大师殿堂" + '-' + BASE_TITLE
          else
            "【色彩大师 | 大师作品】- 大师殿堂" + '-' + BASE_TITLE
          end
        elsif controller_name == 'master_interviews' && %w{index all}.include?(action_name)
          "【#{'全部 |' if action_name == 'all'} 大师访谈】- 大师殿堂" + '-' + BASE_TITLE
        elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'oversea'
          if controller_name == "master_interviews"
            "【海外 | 大师访谈】- 大师殿堂" + '-' + BASE_TITLE
          else
            "【海外 | 大师作品】- 大师殿堂" + '-' + BASE_TITLE
          end
        elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'hk_tw_mc'
          if controller_name == 'master_interviews'
            "【港澳台 | 大师访谈】- 大师殿堂" + '-' + BASE_TITLE
          else
            "【港澳台 | 大师作品】- 大师殿堂" + '-' + BASE_TITLE
          end
        elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'cn'
          if controller_name == 'master_interviews'
            "【中国大陆 | 大师访谈】- 大师殿堂" + '-' + BASE_TITLE
          else
            "【中国大陆 | 大师作品】- 大师殿堂" + '-' + BASE_TITLE
          end
        elsif controller_name == 'master_interviews' && action_name == 'show'
          "【iColor设计大师-#{@article.name}】- 简介、访谈、作品、寄语" + '-' + BASE_TITLE
        #大师作品
        elsif controller_name == 'master_designs' && %w{index all}.include?(action_name)
          "【#{'全部 |' if action_name == 'all'} 大师作品】- 大师殿堂" + '-' + BASE_TITLE
        elsif controller_name == 'master_designs' && action_name == 'show'
          "【#{@master_design.design_name} | #{@master_design.master_profile.try(:name) || @master_design.master_name}】- 室内空间大师" + '-' + BASE_TITLE
        #装修图库
        elsif controller_name == 'design_images' && action_name == 'index'
          case params[:path]
          when '0-0-359-0-0-0-0-0-0-126-0-0-0_0_0_0_0_0'
            '罗马柱装修效果图,样板房装修,欧式古典风格装修_立邦 iColor官方网站'
          when '0-0-0-0-0-0-72-0-0-125-0-0-0_0_0_0_0_0'
            '出租房装修,装修设计,实用,装修效果图_立邦 iColor官方网站'
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
            s1, s2, s3 = "", "", ""
            if @content.present? || @imageable_type.present?
              s1 = @content[0..8].compact.join(',').to_s if @content[0..8].present?
              s2 = @content[9..10].compact.join('').to_s if @content[9..10].present?
              s3 = @content[11].to_s if @content[11].present?
              if @content[12].present?
                "【#{@content[12].to_s}】装修效果图，【#{@content[12].to_s}】效果图，【#{@content[12].to_s}】设计效果图 - 立邦icolor"
              else
                "#{@imageable_type}#{s1},#{s2}装修效果图, #{s3} - 立邦 iColor"
              end
            else
               "装修效果图大全最新2013、2013年室内装修效果图大全、家庭装修效果图 - 立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
            end
          end
        elsif controller_name == 'design_images' && action_name == 'image_show'
          case params[:id]
          when '108487'
            '90平米小户型北欧小清新厨房装修效果图大全2012图片装修图片_立邦 iColor官方网站'
          else
            "#{@image.title}装修图片 - 立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
          end
        elsif controller_name == 'design_images' && action_name == 'fullscreen'
          "【#{@design_name}】大图  【#{@author}】 -  立邦icolor"
        #设计之星
        elsif controller_name == 'weekly_stars' && %w{weekly_stars_week index show}.include?(action_name)
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
          "【作品展示】- 设计鉴赏" + '-' + BASE_TITLE
        elsif controller_name == 'designs' && action_name == 'show'
          "【#{@design.user.display_name} | #{@design.title}】- 设计鉴赏" + '-' + BASE_TITLE
        #幻灯片
        elsif controller_name == 'designs' && action_name == 'fullscreen'
          "【#{@design_name}】大图  【#{@author}】 -  立邦icolor"
        #色彩搭配
        elsif controller_name == 'color_designs' && action_name == 'index'
          "【色彩搭配】- 设计鉴赏" + '-' + BASE_TITLE
        elsif controller_name == 'color_designs' && action_name == 'show'
          "【#{@design.design_style} #{@design.design_color} #{@design.design_usage} | 色彩搭配】- 设计鉴赏" + '-' + BASE_TITLE
        #灵感秀
        elsif controller_name == 'inspirations' && action_name == 'index'
          "【灵感秀】- 设计鉴赏" + '-' + BASE_TITLE
        elsif controller_name == 'inspirations' && action_name == 'inspirations_new'
          "【最新 | 灵感秀】- 设计鉴赏" + '-' + BASE_TITLE
        elsif controller_name == 'inspirations' && action_name == 'inspirations_hot'
          "【最热 | 灵感秀】- 设计鉴赏" + '-' + BASE_TITLE
        elsif controller_name == 'inspirations' && action_name == 'inspirations_minisite'
          "【刷新21天 | 灵感秀】- 设计鉴赏" + '-' + BASE_TITLE
        elsif controller_name == 'inspirations' && action_name == 'show'
          "【#{@inspiration.title} | 灵感秀】- 设计鉴赏" + '-' + BASE_TITLE
        #业主通道
        elsif controller_name == 'channel' && action_name == 'refresh_service'
          "刷新服务|icolor和您一起刷新家，新开始 - 立邦iColor官方网站"
        elsif controller_name == 'channel'
          "【设计快查】- 装修公司免费推荐 -立邦iColor"
        elsif controller_name == 'faqs'
          "【装修问答】- 业主通道" + '-' + BASE_TITLE
        elsif controller_name == 'mix_colors'
          "【配色咨询】- 业主通道" + '-' + BASE_TITLE
        #行业资讯
        elsif controller_name == 'articles' && action_name == 'index'
          "【装修资讯】- 行业资讯" + '-' + BASE_TITLE
        elsif controller_name == 'articles' && action_name == 'show'
          "【#{@article.title} | 装修资讯】- 行业资讯" + '-' + BASE_TITLE
        elsif controller_name == 'color_articles' && action_name == 'index'
          "【色彩资讯】- 行业资讯" + '-' + BASE_TITLE
        elsif controller_name == 'master_topics' && action_name == 'index'
          "【业内动态】- 行业资讯" + '-' + BASE_TITLE
        elsif controller_name == 'master_topics' && action_name == 'show'
          "【#{@topic.title} | 业内动态】- 行业资讯" + '-' + BASE_TITLE
        elsif controller_name == 'softwares' && action_name == 'case'
          "【色彩案例搭配 | 案例下载】- 应用工具" + '-' + BASE_TITLE
        elsif controller_name == 'softwares' && action_name == 'tools'
          "【在线配色软件 | 配色软件】- 应用工具" + '-' + BASE_TITLE
        #漆光异彩
        elsif controller_name == 'function' && action_name == 'art'
          "【MILANO米兰诺艺术效果】- 漆光异彩" + '-' + BASE_TITLE
        elsif controller_name == 'function' && action_name == '7-1'
          "【木纹风尚生活】- 漆光异彩" + '-' + BASE_TITLE
        #精彩活动
        elsif controller_name == 'designer_events' #&& %w{index index_2 index_3}.include?(action_name)
          "【设计师活动】- 精彩活动" + '-' + BASE_TITLE
        elsif controller_name == 'other_events' && action_name == 'index'
          "【其他活动】- 精彩活动" + '-' + BASE_TITLE
        elsif controller_name == 'other_events'
          "【木纹风尚生活】- 精彩活动" + '-' + BASE_TITLE
        elsif controller_name == 'gifts' && action_name == 'index'
          "【获奖名单】- 精彩活动" + '-' + BASE_TITLE
        elsif controller_name == 'refresh_record' && action_name == 'show'
          "[#{@life_memoir.s_title}]｜ icolor和您一起刷新家，新开始 －   立邦iColor官方网站"
        elsif controller_name == 'refresh_record'
          "刷新实录|icolor和您一起刷新家，新开始 - 立邦iColor官方网站"
        elsif controller_name == 'refresh_show'
          "刷新效果|icolor和您一起刷新家，新开始 - 立邦iColor官方网站"
        elsif controller_name == 'refresh_list'
          "刷新生活精彩资讯｜icolor和您一起刷新家，新开始 －   立邦iColor官方网站"
        else
          BASE_TITLE
        end
    rescue
      BASE_TITLE
  end

  def des_content
    star_descript1 = "立邦iColor装修设计鉴赏带您领略iColor"
    star_descript2 = "设计师装修设计作品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    channel_descript = "填写申请表后，立邦iColor为您免费推荐3家同城优秀家装公司。浏览2013装修效果图大全、欣赏设计师独家作品、搜索全国热门装修公司，就在立邦icolor。"
    article_desctipt = "立邦iColor装修设计鉴赏涵盖丰富、专业的装家具修行业资讯,包括：色彩资讯、业内动态供您参阅,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    designer_events_descript = "立邦iColor装修设计鉴赏将定期举办精彩活动,并邀设计师参加活动,成为设计师展现家居装修设计风采专业平台.还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."

    #首页
    if  controller_name == 'home'
      "立邦iColor轻松教您怎么装修设计,如何装修房子,立邦iColor装修设计,鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的怎么装修资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor官方网站."
    #大师访谈
    elsif %w{master_interviews master_designs}.include?(controller_name) && params[:type] == 'shinei'
      "立邦iColor装修设计鉴赏带您欣赏顶级的国际、港澳台、国内知名室内空间设计大师装修设计作品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif %w{master_interviews master_designs}.include?(controller_name) && params[:type] == 'color'
      "立邦iColor装修设计鉴赏带您欣赏顶级的国际、港澳台、国内知名色彩设计大师装修设计作品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'master_interviews' && %w{index all}.include?(action_name)
      "立邦iColor装修设计鉴赏带您领略顶级的国际、港澳台、国内知名设计大师,通过iColor设计师访谈欣赏设计大师所完成的经典国际家居设计精品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'oversea'
      "立邦iColor装修设计鉴赏带您领略顶级的国际、海外知名设计大师,通过iColor设计师访欣赏略设计大师所完成的经典国际家居设计精品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'hk_tw_mc'
      "立邦iColor装修设计鉴赏带您领略顶级的港澳台地区知名设计大师,通过iColor设计师访谈欣赏设计大师所完成的经典国际家居设计精品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'cn'
      "立邦iColor装修设计鉴赏带您领略顶级国内知名设计大师,通过iColor设计师访谈欣赏设计大师所完成的经典国际家居设计精品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'master_interviews' && action_name == 'show'
      "立邦 iColor顶级【国际、港澳台、国内知名设计大师】-#{@article.name},简介,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    #大师作品
    elsif controller_name == 'master_designs' && %w{index all}.include?(action_name)
      "立邦iColor装修设计鉴赏带您欣赏顶级的国际、港澳台、国内知名室内空间设计大师以及色彩设计大师装修设计作品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'master_designs' && action_name == 'show'
      "立邦iColor装修设计鉴赏带您欣赏顶级的【国际、港澳台、国内知名色彩设计大师、室内空间设计大师】#{@master_design.design_name},#{@master_design.master_profile.try(:name) || @master_design.master_name},还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
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
        if @content.present? || @imageable_type.present?
          s1, s2 = "", ""
          s1 = @content[0..10].collect{|c| c.present? ? c : nil }.compact.join(',').to_s  if @content[0..10].present?
          s2 = @content[11..25].collect{|c| c.present? ? c : nil }.compact.join('、').to_s  if @content[11..25].present?
          "立邦 iColor装修图库，精心挑选#{@imageable_type}" + s1 + "2013装修图片大全，方便您设计自己的" + s2 + "装修效果图，满足您的个性化装修需求。"
        else
          "立邦 iColor装修图库，提供近6万张最流行的装修效果图大全2013图片、室内装修效果图大全欣赏、装修风格鉴赏，展示丰富的客厅、厨房、卫生间、卧室、阳台等各种分类装修效果图，满足您的一切装修设计需求。"
        end
      end
    elsif controller_name == 'design_images' && action_name == 'image_show'
      case params[:id]
      when '108487'
        '立邦 iColor 装修图库装修效果图专区,包含多种厨房装修效果图大全2012图片,提供2013年国内外最新的90平米小户型北欧小清新厨房装修效果图大全2012图片装修图片,设计效果图,是目前更新速度最快、最经典的装修效果图案例,更多厨房装修效果图,灵感家装图片尽在立邦iColor官方网站'
      else
        "立邦 iColor 装修图库装修效果图专区，提供2013年国内外最新的#{@image.title}装修图片，设计效果图，是目前更新速度最快、最经典的装修效果图案例。"
      end
    #设计之星
    elsif controller_name == 'weekly_stars' && %w{weekly_stars_week index}.include?(action_name)
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
      "立邦iColor装修设计鉴赏带您领略优秀的立邦iColor设计师专业装修设计作品,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'designs' && action_name == 'show'
      "立邦iColor明星设计师 — 设计师姓名作品作品名称.还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    #色彩搭配
    elsif controller_name == 'color_designs' && action_name == 'index'
      "立邦iColor装修设计鉴赏带您领略色彩搭配装修效果图,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'color_designs' && action_name == 'show'
      "立邦iColor装修设计鉴赏带您领略风格,色系,区域,色彩搭配装修效果图,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    #灵感秀
    elsif controller_name == 'inspirations' && action_name == 'index'
      "立邦iColor装修设计鉴赏灵感秀充满了最新、最热的灵感图片,帮您寻找装修设计灵感元素,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'inspirations' && action_name == 'inspirations_new'
      "立邦iColor装修设计鉴赏灵感秀充满了最新灵感图片,帮您寻找装修设计灵感元素,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'inspirations' && action_name == 'inspirations_hot'
      "立邦iColor装修设计鉴赏灵感秀充满了最热灵感图片,帮您寻找装修设计灵感元素,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'inspirations' && action_name == 'inspirations_minisite'
      "立邦iColor装修设计鉴赏刷新21天活动,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'inspirations' && action_name == 'show'
      "立邦iColor装修设计鉴赏灵感秀灵感秀名称,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    #业主通道
    elsif controller_name == 'channel'
      channel_descript
    elsif controller_name == 'faqs'
      channel_descript
    elsif controller_name == 'mix_colors'
      "立邦iColor装修设计鉴赏为您提供配色资讯服务,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    #行业资讯
    elsif controller_name == 'articles' && action_name == 'index'
      article_desctipt
    elsif controller_name == 'articles' && action_name == 'show'
      article_desctipt
    elsif controller_name == 'color_articles' && action_name == 'index'
      article_desctipt
    elsif controller_name == 'master_topics' && action_name == 'index'
      article_desctipt
    elsif controller_name == 'master_topics' && action_name == 'show'
      article_desctipt
    elsif controller_name == 'softwares' && action_name == 'case'
      "立邦iColor装修设计鉴赏为您提供专业色彩案例搭配供您下载,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'softwares' && action_name == 'tools'
      "立邦iColor装修设计鉴赏为您提供专业的在线配色软件应用,更加方便、快速生成符合您装修设计的配色方案,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    #漆光异彩
    elsif controller_name == 'function' && action_name == 'art'
      "立邦iColor装修设计鉴赏带您欣赏MILANO米兰诺艺术漆,刷出漆光异彩,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    elsif controller_name == 'function' && action_name == '7-1'
      "立邦iColor装修设计鉴赏带您欣赏木纹风尚生活,刷新美木纹生活新风尚,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    #精彩活动
    elsif controller_name == 'designer_events' #&& %w{index index_2 index_3}.include?(action_name)
      designer_events_descript
    elsif controller_name == 'other_events' && action_name == 'index'
      designer_events_descript
    elsif controller_name == 'other_events'
      designer_events_descript
    elsif controller_name == 'gifts' && action_name == 'index'
      "立邦iColor装修设计鉴赏刷新生活21天,并邀设计师参加活动,成为设计师展现家居装修设计风采专业平台.还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    else
      "立邦iColor装修设计鉴赏涵盖世界级大师访谈,大师设计作品与专业设计作品欣赏,为你带来更多装修灵感以及专业的家装资讯,更有家装专业实用工具,满足你的色彩家装需求,还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
    end
  end

  def keyword_content
    star_key = "iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    inspirations_key = "iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    softwares_key = "iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    art_key = "iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    designer_events_key = "iColor立邦活动,设计师活动,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"

    #首页
    if controller_name == 'home' && action_name == 'index'
      "怎么装修设计,室内装潢装饰设计,室内家装设计,装修效果图,立邦,iColor"
    #大师访谈
    elsif %w{master_interviews master_designs}.include?(controller_name) && params[:type] == 'shinei'
      "室内空间设计师,色彩设计师,装修设计师,明星设计师,家装经典作品,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif %w{master_interviews master_designs}.include?(controller_name) && params[:type] == 'color'
      "色彩设计师,室内设计师,装修设计大师,明星设计师,装修设计大师,室内空间设计,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'master_interviews' && %w{index all}.include?(action_name)
      "海外设计师,国际设计师,香港,台湾,港澳台设计师.中国设计师,室内设计师,iColor设计师访谈,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'oversea'
      "海外设计师.国际设计师,装修大师,室内设计师,装修设计师,iColor设计大师访谈,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'hk_tw_mc'
      "香港,台湾,港澳台设计师,装修大师,室内设计师,装修设计师,iColor设计大师访谈,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif %w{master_interviews master_designs}.include?(controller_name) && action_name == 'cn'
      "中国设计师,装修大师,室内设计师,装修设计师,iColor设计师访谈,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'master_interviews' && action_name == 'show'
      "iColor设计大师,#{@article.name},简介,访谈,作品,寄语,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #大师作品
    elsif controller_name == 'master_designs' && %w{index all}.include?(action_name)
      "iColor设计师,室内空间大师,色彩设计大师,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'master_designs' && action_name == 'show'
      "#{@master_design.design_name},#{@master_design.master_profile.try(:name) || @master_design.master_name},家居家居装饰,装修建材,建材导购室内装修,装修图片,装修效果图,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #设计之星
    elsif controller_name == 'weekly_stars' && %w{weekly_stars_week index}.include?(action_name)
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
      "装修案例,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'designs' && action_name == 'show'
      "装修案例,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    #色彩搭配
    elsif controller_name == 'color_designs' && action_name == 'index'
      "色彩搭配,色彩装修案例,#{params[:design_style].present? ? params[:design_style] : '风格' },#{params[:design_color].present? ? params[:design_color] : '色系' },#{params[:design_usage].present? ? params[:design_usage] : '区域' },iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'color_designs' && action_name == 'show'
      "#{params[:design_style].present? ? params[:design_style] : '风格' },#{params[:design_color].present? ? params[:design_color] : '色系' },#{params[:design_usage].present? ? params[:design_usage] : '区域' },色彩搭配,色彩装修案例iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
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
      inspirations_key
    #业主通道
    elsif controller_name == 'channel'
      "设计报名,设计推荐,装修公司,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'faqs'
      "装修知识,家装知识,装修经验,家居装修,装修指导,室内装修知识,iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    elsif controller_name == 'mix_colors'
      "配色方案,配色服务,配色咨询iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
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
    elsif controller_name == 'softwares' && action_name == 'case'
      "装修效果图下载,家装案例分享," + softwares_key
    elsif controller_name == 'softwares' && action_name == 'tools'
      "配色方案,配色软件,家装配色软件," + softwares_key
    #漆光异彩
    elsif controller_name == 'function' && action_name == 'art'
      "MILANO米兰诺艺术漆,艺术漆效果图,微电影" + art_key
    elsif controller_name == 'function' && action_name == '7-1'
      "木纹漆,木纹效果图," + art_key
    #精彩活动
    elsif controller_name == 'designer_events' #&& %w{index index_2 index_3}.include?(action_name)
      designer_events_key
    elsif controller_name == 'other_events' && action_name == 'index'
      designer_events_key
    elsif controller_name == 'other_events'
      designer_events_key
    elsif controller_name == 'gifts' && action_name == 'index'
      designer_events_key
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
        if @content.present? || @imageable_type.present?
          content = ""
          content = @content.collect{|c| c }.compact.join(',').to_s if @content.present?
          "#{@imageable_type}#{content}装修图片,装修效果图"
        else
          "装修,装修设计,室内装修效果图大全,装修效果图,装修效果图大全2013图片,装修图片,装修风格"
        end
      end
    elsif controller_name == 'design_images' && action_name == 'image_show'
      case params[:id]
      when '108487'
        '厨房装修效果图大全2012图片,90平米小户型北欧小清新厨房,装修效果图,iColor,立邦'
      else
        "#{@image.title}装修图片,设计效果图,装修图库"
      end
    else
      "iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
    end
  end

  def forward_links(title, url = '', pic = '', id, type)
    uri_title = URI.encode(title)
    unless pic.nil?
      if type =~ %r(MasterInterview|MasterDesign)
        raw '<span style="height:18px;position:absolute; left:-178px; background-color:none;">
              一键转发：
              <span class="popup_zf2 group" style="background:#fff;bottom:-4px;*bottom:-5px!important; left:70px;width:90px;border:0;" data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" data-pic="http://'+request.host_with_port + pic+'" >
                <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
                <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
                <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
                <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
              </span>
            </span>'
      elsif type =~ %r(Mood|WeeklyStar)
        raw '<span class="popup_zf group none" style="bottom:-6px;" data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" data-pic="http://'+request.host_with_port + pic+'">
              <span style="color:#000;padding:0 5px!important;">一键转发：</span>
              <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
              <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
              <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
              <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
            </span>'
      else
        raw '<span data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" data-pic="http://'+request.host_with_port + pic+'" class="popup_zf group none" style="background:white;">
              <span style="background:white;padding:0; margin:0; line-height:14px;">
                一键转发：
              </span>
              <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
              <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
              <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
              <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
            </span>'
      end
    else
      if type =~ %r(MasterInterview|MasterDesign)
        raw '<span style="height:18px;position:absolute; left:-178px; background-color:none;">
                一键转发：
                <span class="popup_zf2 group" style="background:#fff;bottom:-4px;*bottom:-5px!important; left:70px;width:90px;border:0;" data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" >
                  <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
                  <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
                  <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
                  <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
                </span>
              </span>'
      elsif type =~ %r(Mood|WeeklyStar)
        raw '<span class="popup_zf group none" style="bottom:-6px;" data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'">
              <span style="color:#000;padding:0 5px!important;">一键转发：</span>
              <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
              <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
              <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
              <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
            </span>'
      else
        raw '<span data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" class="popup_zf group none" style="background:white;">
              <span style="background:white; padding:0; margin:0; line-height:14px;">
              一键转发：
              </span>
              <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
              <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
              <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
              <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
            </span>'
      end
    end
  end


  def set_style
    @set_style ||= set_style_value
  end

  def set_style_value
    case controller_name
      when "color_articles"
        return { :pic_path => "/assets/news/title_news.png" }
      when /^master|contact/
        return { :pic_path => "/assets/master/title_master.png" }
      when "channel"
        return { :pic_path => "/assets/news/title_owner.png" }
      when "faqs"
        return { :pic_path => "/assets/news/title_owner.png" }
      when "softwares"
        return { :pic_path => "/assets/news/title_tools.png" }
      when "designs"
        case action_name
          when "index"
            return { :pic_path => "/assets/design/title_design.png" }
        end
      when "inspirations"
        case action_name
          when "show"
            return { :pic_path => "/assets/design/title_design.png" }
          else
            return { :pic_path => "/assets/design/title_design.png" }
        end
      when "industry_news"
        return { :pic_path => "/assets/news/title_news.png" }
      when "articles"
        return { :pic_path => "/assets/news/title_news.png" }
    end
  end

  #Display a custom sign_in form anywhere in your app

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def color_master_image
    if params[:type] == "color"
      url = "master/color_master_hover.png"
    else
      url = "master/color_master_btn.png"
    end
    url
  end

  def space_master_image
    if params[:type] == "shinei"
      url = "master/space_master_hover.png"
    else
      url = "master/space_master_btn.png"
    end
    url
  end

  def show_avatar(*args)
    user, type, size = args[0], args[1], args[2]
    if user.avatar.present?
      link_to image_tag("#{user.avatar.file.url(type.blank? ? :original : type.to_sym)}", size: "#{size if size.present?}"), user_path(user)
    else
      link_to image_tag(asset_path("news/regimg_bg.jpg"), size: "#{size if size.present?}"), user_path(user)
    end
  end

  def avatar_img(*args)
    user, type, size = args[0], args[1], args[2]
    if user.avatar.present?
       image_tag("#{user.avatar.file.url(type.blank? ? :original : type.to_sym)}", size: "#{size if size.present?}")
    else
       image_tag(asset_path("news/regimg_bg.jpg"), size: "#{size if size.present?}")
    end
  end

  #家装公司个性主页helper
  #获取最新的行业资讯
  def get_articles
    Subject.content("articles")
  end

  #获取公司推荐设计师
  def get_recommended_designer
    User.select("id,username,name,role_id,inauguration_company").where(:role_id => 1, :inauguration_company => @user.display_name).limit 4
  end

  def get_designs
    @user.designs.map {|design| design.design_images}.flatten! || []
  end

  def get_skin_kvs
    if (skin = Skin.find_by_skin_type_id(session[:skin_type])).present?
      skin.skin_kv_uploads
    end
  end

  def get_weekly_stars
    user_urls = WeeklyStar.order("published_at desc").select("author_url").limit 5
    ws = []
    user_urls.each do |ul|
      s = ul.author_url.match(%r(http://www.icolor.com.cn/users/(\d{1,})?)).to_a[1]
      ws << User.select("id,username,name").find(s) unless s.blank?
    end
    ws
  end

  #/national_day 活动一：火眼金睛寻宝图（10.1开始每天10.01分更新图片）
  def get_pic
    # pic_urls = %w(http://www.icolor.com.cn/users/65668/designs/2605
    #               http://www.icolor.com.cn/users/63178/designs/1822
    #               http://www.icolor.com.cn/inspirations/1088
    #               http://www.icolor.com.cn/color_designs/467
    #               http://www.icolor.com.cn/users/64528/designs/1906
    #               http://www.icolor.com.cn/users/65637/designs/2250
    #               http://www.icolor.com.cn/users/66071/designs/2473)

    month,day,time,hour = Time.now.month, Time.now.day, Time.now, Time.now.hour

    if month < 10 || (month == 10 && day ==1 && hour < 10)
      return image_tag(asset_path("october/october_img.jpg"))
    elsif month == 10 && (1..7).include?(day)
      if hour >= 10
        image_tag(asset_path("october/#{day}.jpg")) #, pic_urls[day-1]
      else
        image_tag(asset_path("october/#{day-1}.jpg")) #, pic_urls[day-2]
      end
    end
  end

  def link_suffix
    "#from=top"
  end

  def footer_links
    c_name = case controller_name
    when /design_images/
      'design_images_links'
    else
      'default_links'
    end
    "layouts/footer_links/#{c_name}"
  end

  # TASK290
  ALLOW_CONVERSION = Hash.new {|k,v| k[v] = []}.tap do |hash|
    hash[:home]          = [:index];
    hash[:design_images] = [:index]
    hash[:channel]       = [:access]
  end

  def rendered_script_conversion
    ctrl,act = params[:controller],params[:action]
    path_url = "conversion/#{ctrl}_#{act}"
    render(path_url) if allow_conversion(ctrl,act)
  end

  def allow_conversion(ctrl,act)
    ctrl,act = ctrl.to_sym,act.to_sym
    ALLOW_CONVERSION[ctrl].tap do |actions|
      return actions.include?(act)
    end
  end
end