# -*- encoding : utf-8 -*-
require 'nokogiri'
require 'open-uri'

namespace :celebrity do
  desc '名家设计初始化一些数据'
  task :init_data => :environment do
    %w{ 空间设计 色彩设计 软装设计 园艺设计 装修施工 }.each do |name|
      CelebrityContentBoard.create name: namespace
    end
  end
end
