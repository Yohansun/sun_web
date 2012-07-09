# -*- encoding : utf-8 -*-
task :export_seller_data => :environment  do
	require 'csv'

	areas = Area.find(1323).self_and_descendants
	companies = User.where("area_id in (?) and role_id = ?", areas, 2).order("is_top desc","top_order asc") 
	
	csv_string = CSV.open("#{Rails.root}/lib/data/export_data/export_seller_data.csv", "wb") do |csv|
		csv
		csv << ['公司名称','开户时间','公司电话','公司邮箱','本月销售额','畅销产品Top1','畅销产品Top2','畅销产品Top3','累计上线数','本月作品数',
						'累计作品数','本月被投票数','累计被投票数','本月被评论数','累计被评论数','是否置顶','入选每周之星']

		companies.each do |user|

			is_weekly_start = ""
			current_month = user.seller_datas.current_month.first 
			current_designs = user.designs.where("DATE_FORMAT(created_at, '%Y%m') = ?" , Time.now.strftime("%Y%m"))

			WeeklyStar.find_each do |w|
				if w.author_url.match %r(user.id)
					is_weekly_start = "是"
				else
					is_weekly_start = "否"
				end	
			end	

			puts "staring..."
			puts "No...... %s" % user.id
			csv << [ user.display_name,
							user.created_at.strftime("%Y-%m-%d"), 
							user.try(:phone),
							user.try(:email),
							current_month.try(:sales),
							current_month.try(:product_top1),
							current_month.try(:product_top2),
							current_month.try(:product_top3),

							user.try(:sign_in_count),
							current_designs.count,
							user.designs.count,

							current_designs.sum(:votes_count),
							user.designs.sum(:votes_count),

							current_designs.map {|d| d.comments.count }.sum,
							user.designs.map {|d| d.comments.count }.sum,

							user.try(:top_order),
							is_weekly_start
						]
			puts "Enddddddddddd"
		end
	end
end
