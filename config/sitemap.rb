RECORD_COUNT = 500
# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.icolor.com.cn"
PICTURES_HOST = "http://www.icolor.com.cn%s"

String.class_eval do
  def del; delete('/'); end
end

[MasterProfile,MasterDesign,DesignImage,Post,Faq].each {|klass| klass.class_eval {scope :sitemap, order("id desc").limit(RECORD_COUNT)}}
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'

  group(:sitemaps_path => "",:filename => :sitemap) do
    #首页
    add root_path,              :priority => 1.0, :changefreq => "weekly", :lastmod => Time.now
    #大师殿堂
    add master_interviews_path, :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #大师作品
    add master_designs_path,    :priority => 1.0, :changefreq => "weekly", :lastmod => Time.now
    #装修图库
    add design_images_path,     :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #设计之星
    add weekly_stars_path,      :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #作品展示
    add designs_path,           :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #色彩搭配
    add color_designs_path,     :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #灵感秀
    add inspirations_path,      :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #业主通道
    add channel_access_path,    :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #装修问答
    add faqs_path,              :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #装修贴士
    add "/faqs#tips",           :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #配色咨询
    add mix_colors_path,        :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #刷新服务
    add "http://www.nipponpaint.com.cn/shuaxin/fuwu/",    :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #行业资讯
    add articles_path,          :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #色彩资讯
    add color_articles_path,    :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #业内动态
    add master_topics_path,     :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #应用工具
    add softwares_tools_path,   :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #案例下载
    add softwares_case_path,    :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #漆光艺彩
    add art_path,               :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #木纹风尚生活
    add "/7-1",                 :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #精彩活动
    add designer_events_path,   :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #其他活动
    add other_events_path,      :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
    #获奖名单
    add gift_list_path,         :priority => 0.6, :changefreq => "weekly", :lastmod => Time.now
  end

  #大师访谈
  group(:sitemaps_path => master_interviews_path.del, :filename => :master_interviews) do
    MasterProfile.sitemap.each do |master_profile|
      add master_design_path(master_profile)
    end
  end

  #大师作品
  group(:sitemaps_path => master_designs_path.del, :filename => :master_designs) do
    MasterDesign.sitemap.each do |master_design|
      add master_design_path(master_design)
    end
  end

  #装修图库
  group(:sitemaps_path => design_images_path.del,:filename => :design_images) do
    DesignImage.sitemap.each do |design_image|
      add design_images_path, :images => [{:loc => PICTURES_HOST%design_image.file.url(:thumb) ,:title => design_image.title }]
    end
  end

  #行业资讯
  group(:sitemaps_path => articles_path.del, :filename => :articles) do
    Post.sitemap.each do |post|
      add article_path(post)
    end
  end

  #装修问答
  group(:sitemaps_path => faqs_path.del,:filename => :faqs) do
    Faq.sitemap.each do |faq|
      add faq_path(faq)
    end
  end

  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
