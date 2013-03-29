# -*- encoding: utf-8 -*-
require "csv"

desc "导入外部硬广点击数据"
task :import_click_data => :environment  do

  p "Starting~~~~~~~~~~~~~~~~~"
  time_array = []
  #file_array = ["landing.log.20130102","landing.log.20130103","landing.log.20130105","landing.log.20130106","landing.log.20130109","landing.log.20130110","landing.log.20130112","landing.log.20130113","landing.log.20130114","landing.log.20130115","landing.log.20130116"]
  #file_array.each do |file|
  file_name = "#{Rails.root}/public/system/landing_log/" + "landing.log." + (Time.now - 1.day).strftime("%Y%m%d")
  if File.exist?(file_name)
    File.open(file_name, "r").each_line do |line|
      line_time = line.scan(/[0-9]{4}-[0-9]{2}-[0-9]{2}/)[0]
      line_content = line.scan(/\=[0-9a-z-_]+/)[0].to_s.gsub('=','')
      time_array << [line_time, line_content]
    end

    days = time_array.map{|t| t[0] }.uniq
    contents = time_array.map{|t| t[1] }.uniq
    value_count_time_hash = {}
    days.each do |time|
      value_count_hash = {}
      time_array.each do |t|
        value_count_hash[t[1]] = 0
      end
      time_array.each do |t|
        value_count_hash[t[1]] += 1 if t[0] == time
      end
      value_count_time_hash[time] = value_count_hash
      p value_count_time_hash.keys
    end

    days.each do |day|
      contents.each do |content|
        if content.present?
          hs = HardSell.new
          hs.link = 'http://www.icolor.com.cn/landing?source=' + content.to_s
          hs.date = day
          if value_count_time_hash[day][content] != 0
            hs.num = value_count_time_hash[day][content]
          else
            hs.num = 0
          end
          case content
          when "80018shouyetupian2","dianpingwang_shouyetupianlunbo","dianpingwang_shouyetupianlunbo2"
            hs.feature = "首页图片轮播"
            hs.site = "装修点评网"
          when "80018ketingpingdao2"
            hs.feature = "客厅频道"
            hs.site = "装修点评网"
          when "80018ketingpingdao2"
            hs.feature = "80018woshipingdao2"
            hs.site = "装修点评网"
          when "80018secaidapei2"
            hs.feature = "色彩搭配"
            hs.site = "装修点评网"
          when "a963shouyedingbu2","a963shouyejiaodian2","a963shouyedidiyiping2","a963shouyeredian2","a963shouyemingrenzhuanfang2"
            hs.feature = "首页"
            hs.site = "A963"
          when "a963shejishitongdao2"
            hs.feature = "设计师通道"
            hs.site = "A963"
          when "a963zixunzhongxinjiaodianxinwen2"
            hs.feature = "资讯中心"
            hs.site = "A963"
          when "a963edmhuiyuanyoujian2"
            hs.feature = "会员EDM"
            hs.site = "A963"
          when "pchousebankuaidingzhi2","pchousebankuaidingzhi-2"
            hs.feature = "版块定制"
            hs.site = "太平洋家居网"
          when "souhu_jiajushouyedaogoubangshou"
            hs.feature = "搜狐家居首页导购帮手"
            hs.site = "搜狐焦点网"
          when "souhu_jiajubeijingyemiandaogoubangshou"
            hs.feature = "搜狐家居北京页面导购帮手"
            hs.site = "搜狐焦点网"
          when "souhu_zhuangxiuzongluntantiezizhidingqu"
            hs.feature = "装修总论坛帖子置顶区"
            hs.site = "搜狐焦点网"
          when "pipa_shouyezhtizhuangxiu","pipa_shouyezhtizhuangxiu2"
            hs.feature = "首页-主题装修"
            hs.site = "篱笆网"
          when "327_soufang1","327_soufang_ck1"
            hs.feature = "全国行业频道"
            hs.site = "搜房网"
          when "327_soufang2","327_soufang_ck2"
            hs.feature = "新闻详情页"
            hs.site = "搜房网"
          when "327_soufang3","327_soufang_ck3"
            hs.feature = "品牌论坛帖子详情页"
            hs.site = "搜房网"
          when "327_soufang4","327_soufang_ck4"
            hs.feature = "北京首页"
            hs.site = "搜房网"
          when "327_soufang5","327_soufang_ck5"
            hs.feature = "上海首页"
            hs.site = "搜房网"
          when "327_soufang6","327_soufang_ck6"
            hs.feature = "广州首页"
            hs.site = "搜房网"
          when "327_soufang7","327_soufang_ck7"
            hs.feature = "深圳首页"
            hs.site = "搜房网"
          when "327_soufang8","327_soufang_ck8"
            hs.feature = "天津首页"
            hs.site = "搜房网"
          when "327_soufang9","327_soufang_ck9"
            hs.feature = "重庆首页"
            hs.site = "搜房网"
          when "327_soufang10","327_soufang_ck10"
            hs.feature = "成都首页"
            hs.site = "搜房网"
          when "327_soufang11","327_soufang_ck11"
            hs.feature = "武汉首页"
            hs.site = "搜房网"
          when "327_soufang12","327_soufang_ck12"
            hs.feature = "杭州首页"
            hs.site = "搜房网"
          when "327_soufang13","327_soufang_ck13"
            hs.feature = "石家庄首页"
            hs.site = "搜房网"
          when "327_soufang14","327_soufang_ck14"
            hs.feature = "小区网"
            hs.site = "搜房网"
          when "souhu_zhuangxiudaxue_shouye","souhu_jiajushouye","souhu_jiajushejishi","souhu_tuliaopindao","souhu_xinwenzhongxin","souhu_bendixinwen","327_souhujiaodian_kc1","327_souhujiaodian_kc2","327_souhujiaodian_kc3","327_souhujiaodian_kc4","327_souhujiaodian_kc5","327_souhujiaodian_kc6"
            hs.feature = "搜狐家居"
            hs.site = "搜狐焦点网"
          when "327_hejia1","327_hejia_kc1"
            hs.feature = "和家首页"
            hs.site = "和家"
          when "327_hejia2","327_hejia_kc2"
            hs.feature = "油漆涂料行业频道"
            hs.site = "和家"
          when "327_hejia3","327_hejia_kc3"
            hs.feature = "居尚终端页"
            hs.site = "和家"
          when "327_hejia4","327_hejia_kc4"
            hs.feature = "图文资讯终端页"
            hs.site = "和家"
          when "327_zhuangxiudianpin1","327_zhuangxiudianpin_kc1"
            hs.feature = "色彩搭配"
            hs.site = "装修点评网"
          when "327_zhuangxiudianpin2","327_zhuangxiudianpin_kc2"
            hs.feature = "网友样板间"
            hs.site = "装修点评网"
          when "327_zhuangxiudianpin3","327_zhuangxiudianpin_kc3"
            hs.feature = "设计师"
            hs.site = "装修点评网"
          else
            hs.feature = "其他版块"
            hs.site = "其他站点"
          end
          hs.save
          p "."
        end
      end
    end
    p "Finished"
  else
    p file_name + " File doesn't exist!"
  end
end