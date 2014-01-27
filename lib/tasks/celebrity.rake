# -*- encoding : utf-8 -*-
require 'nokogiri'
require 'open-uri'

namespace :celebrity do
  desc '对化名人初始化数据'
  task :init_data => :environment do
    %w{ 空间设计 色彩设计 软装设计 园艺设计 装修施工 }.each do |name|
      CelebrityContentBoard.create name: name
    end
    DialogCelebrityPage.create
  end
end
