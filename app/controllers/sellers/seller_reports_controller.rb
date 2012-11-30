# -*- encoding: utf-8 -*-
class Sellers::SellerReportsController < ApplicationController
	layout "sellers"

	def index
		redirect_to(new_seller_user_session_path) unless current_seller_user
	end

	def export
		Spreadsheet.client_encoding = 'UTF-8'

		file_name = params[:file_name]
		statistical_time = Date.parse params[:statistical_time]

		book = Spreadsheet::Workbook.new
		title = "#{file_name}(#{Area.find(current_seller_user.area_id).name}地区)"

    sheet1 = book.create_worksheet :name => 'iColor经销商报表'
    sheet1[0,0] = title
    sheet1.row(1).concat ['公司名称','开户日期','公司电话','公司邮箱','本月销售额',
    											'畅销产品Top1','畅销产品Top2','畅销产品Top3','累计上线数',
    											'本月作品数','累计作品数','本月被投票数','累计被投票数','本月被评论数',
    											'累计被评论数','是否置顶','入选每周之星','入选月度之星']

    format = Spreadsheet::Format.new :color => "black", :pattern_fg_color => "white", :size => 12
		row_number = 2

    areas = Area.find(current_seller_user.area_id).self_and_descendants
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

			sheet1.update_row row_number,
												user.display_name,
												user.created_at.strftime("%Y-%m-%d"), 
												user.try(:phone),
												user.try(:email),
												current_month.try(:sales),
												current_month.try(:product_top1),
												current_month.try(:product_top2),
												current_month.try(:product_top3),

												user.try(:sign_in_count),
												current_designs.count,
												all_designs.count,

												current_designs.map {|d| d.votes_count }.sum,
												all_designs.map {|d| d.votes_count }.sum,

												current_designs.map {|d| d.comments.count }.sum,
												all_designs.map {|d| d.comments.count }.sum,

												user.try(:top_order),
												is_weekly_start,
												is_month_start

			sheet1.row(row_number).default_format = format
			sheet1.row(row_number).height = 20									

			row_number += 1
		end
		sheet1[row_number+1,0] = "报表时间:" + statistical_time.strftime("%Y/%m/%d").to_s + "-" + statistical_time.months_since(1).strftime("%Y/%m/%d").to_s

		title_format = Spreadsheet::Format.new :pattern_bg_color => "red", :color => "white", :pattern_fg_color => "red", :pattern => 1, :size => 20, :weight => :bold
		sheet1.row(0).default_format = title_format

		bold = Spreadsheet::Format.new :pattern_bg_color => "gray", :color => "black", :pattern_fg_color => "gray", :pattern => 1, :size => 12
    sheet1.row(1).default_format = bold  

    (0..17).each do |number|
    	sheet1.column(number).width = 28 
    end	

    file = "#{Rails.root}/public/seller_user_reports/#{title}.xls"
    FileUtils.mkdir 'public/seller_user_reports' unless File.directory?("public/seller_user_reports")

    unless File.exists? file
    	SellerReport.create!(file_name: title, statistical_time: statistical_time, created_time: Time.now)
   	end 	

   	book.write file
    send_file file
	end
end