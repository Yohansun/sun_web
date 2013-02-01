# -*- encoding : utf-8 -*-
desc "导出上个月经销商报表"
task :export_seller_data_monthly => :environment do
  Spreadsheet.client_encoding = 'UTF-8'

  statistical_time = Time.now.months_ago(1).to_date

  book = Spreadsheet::Workbook.new
  title = "#{Time.now.to_date}经销商后台汇总报表！"

  sheet1 = book.create_worksheet :name => 'iColor经销商报表'
  sheet1[0,0] = title
  day = MagicSetting.statistical_time.blank? ? 06 : MagicSetting.statistical_time.to_i
  sheet1.row(1).concat ['经销商名称','公司名称','公司电话','公司邮箱']

  (2012..Time.now.year).each do |year|
    month_begin = year.eql?(2012) ? 7 : 1
    (month_begin..12).each do |month|
      if Time.now.year > year
        sheet1.row(1).concat ["#{year}年#{month}月"]
      end
    end
  end

  sheet1.row(1).concat ['畅销产品Top1','畅销产品Top2','畅销产品Top3','累计上线数',
                        '累计作品数','累计被投票数','累计被评论数','艺术漆销量']

  format = Spreadsheet::Format.new :color => "black", :pattern_fg_color => "white", :size => 12
  row_number = 2

  seller_users = SellerUser.order("created_at asc").all
  seller_users.each do |seller_user|
    areas = Area.find(seller_user.area_id).self_and_descendants
    companies = User.where("area_id in (?) and role_id = ?", areas, 2).order("is_top desc","top_order asc")

    companies.each_with_index do |user,index|

      is_weekly_start = ""
      is_month_start  = ""
      current_month   = user.seller_datas.where(created_at: statistical_time..statistical_time.months_since(1), apply_for_tools: false).first 
      all_designs     = Design.includes(:user).includes(:design_images).where('design_images.file_file_size > 0').where("users.id" => user.id)
      current_designs = all_designs.where("DATE_FORMAT(designs.created_at, '%Y%m') = ?" , statistical_time.strftime("%Y%m"))

      WeeklyStar.find_each do |w|
        if w.author_url.match %r(user.id)
          if w.star_type_id.eql? 1
            is_weekly_start = "是"
          else
            is_month_start = "是"
          end
        end
      end

      new_row_index = sheet1.last_row_index + 1
      sheet1.row(new_row_index).push   seller_user.username,
                                       user.display_name,
                                       user.try(:phone),
                                       user.try(:email)
      (2012..Time.now.year).each do |year|
        month_begin = year.eql?(2012) ? 7 : 1
        (month_begin..12).each do |month|
          if Time.now.year > year
            date_time = "#{year}-#{month}-#{day}".to_date
            month_consumption = user.seller_datas.where(created_at: date_time..date_time.months_since(1), apply_for_tools: false).first
            sheet1.row(new_row_index).push  month_consumption.try(:sales)
          end
        end
      end
      sheet1.row(new_row_index).push current_month.try(:product_top1),
                                     current_month.try(:product_top2),
                                     current_month.try(:product_top3),
                                     user.try(:sign_in_count),
                                     all_designs.count,
                                     all_designs.map {|d| d.votes_count }.sum,
                                     all_designs.map {|d| d.comments.count }.sum,
                                     current_month.try(:art_paint_quantity)
 
      sheet1.row(row_number).default_format = format
      sheet1.row(row_number).height = 20                  

      row_number += 1
    end
  end
  sheet1[row_number+1,0] = "报表时间:" + statistical_time.strftime("%Y/%m/%d").to_s + "-" + statistical_time.months_since(1).strftime("%Y/%m/%d").to_s

  title_format = Spreadsheet::Format.new :pattern_bg_color => "red", :color => "white", :pattern_fg_color => "red", :pattern => 1, :size => 20, :weight => :bold
  sheet1.row(0).default_format = title_format

  bold = Spreadsheet::Format.new :pattern_bg_color => "gray", :color => "black", :pattern_fg_color => "gray", :pattern => 1, :size => 12
  sheet1.row(1).default_format = bold  

  (0..17).each do |number|
    sheet1.column(number).width = 28 
  end 

  file = "#{Rails.root}/public/system/seller_user_reports/#{title}.xls"
  FileUtils.mkdir 'public/system/seller_user_reports' unless File.directory?("public/system/seller_user_reports")

  unless File.exists? file
    SellerReport.create!(file_name: title, statistical_time: statistical_time, created_time: Time.now)
  end   

  book.write file
end 
