# -*- encoding: utf-8 -*-
desc "初始化华讯新闻列表数据"
task :init_hx_news => :environment  do
  HxNews.transaction do
    (1..7).each_with_index do |index|
      HxNews.create(position: index, title: '标题标题标题', url: 'http://www.icolor.com.cn/')
    end
    HxNews.create(url: 'http://more_url')
  end
end

desc "初始化华浔品味装饰banner数据"
task :init_hx_company_banner => :environment  do
  IBanner.transaction do
    IBanner.create(page_name: '华浔品味装饰',position: 1, size: '670x85')
    IBanner.create(page_name: '华浔品味装饰',position: 2, size: '310x85')
  end
end
