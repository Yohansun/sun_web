# -*- encoding : utf-8 -*-
module MagicContent
  class ReportExportController < BaseController
  	layout 'magic_admin/application'
  	skip_load_and_authorize_resource

  	def index
  		#初始化查询时间
      if params[:start_date].blank?
        params[:start_date] = Time.now.beginning_of_week.to_date.to_s
      end

      if params[:end_date].blank?
        params[:end_date] = Time.now.end_of_week.to_date.to_s
      end

      params[:start_date] += " 00:00:00"
      params[:end_date]   += " 23:59:59"

      begin_t = params[:start_date].to_time(:local)
      end_t   = params[:end_date].to_time(:local)

      case params['role']
     	  when 'zz' then role = {role_id: 1, des_status: false}
     	  when 'zd'	then role = {role_id: 1, des_status: true}
     	  when 'gs'	then role = {role_id: 2}
     	  when 'pt' then role = {role_id: 3}
     	  when 'zm' then role = {is_imported: true}
     	  else role = nil	
     	end

     	case params[:properties]
	     	when 'new' then old_id = 'NULL'
	     	when 'old' then old_id = 'NOT NULL'
	     	else old_id = nil
     	end

     	if params[:area_name].present?
     		area_id = Area.select("id,name").where("name LIKE ?", "%#{params[:area_name]}%").first.try(:id)
     	end

      case params['search']
        when 'user'   then @results = search_for_users(date: begin_t..end_t, role: role, old_id: old_id)
        when 'design' then @results = search_for_designs(date: begin_t..end_t, role: role, old_id: old_id)
        when 'seller' then @results = search_for_seller_datas(area_id: area_id)
      end
  	end

    protected

  	def search_for_users(args)
  		users = User.where(created_at: args[:date])

  		if args[:role]
  			args[:role].each_pair do |key,value|
  				users = users.where("#{key} = ?", value)
  			end
  		end
  		if args[:old_id]
  			users = users.where("old_id is #{args[:old_id]}")
  		end

  		{}.tap do |results|
  			results[:columns] = ['用户ID','用户名','用户性质','邮件地址','联系电话','省','市','区','注册时间','登录次数','招募用户']
  			results[:data] = [].tap do |cell|
  				users.find_each do |user|
  					cell << [user.id,
  									 user.display_name,
  									 user.role_chn_name,
  									 user.try(:email),
  									 user.try(:phone),
  									 user.city.try(:parent).try(:name),
  									 user.try(:city).try(:name), 
  									 user.try(:area).try(:name),
  									 user.created_at.strftime("%Y-%m-%d %H:%M:%S"),
  									 user.sign_in_count,
  									 user.is_imported?]

  				end
  			end
  		end
  	end

  	def search_for_designs(args)
  		designs = Design.includes(:user).includes(:design_images).where('design_images.file_file_size > 0').where("designs.created_at" => args[:date])

  		if args[:role]
  			args[:role].each_pair do |key,value|
  				designs = designs.where("users.#{key} = ?", value)
  			end
  		end
  		if args[:old_id]
  			designs = designs.where("users.old_id is #{args[:old_id]}")
  		end

  		{}.tap do |results|
  			results[:columns] = ['作品ID','上传时间','作品名','推荐色号','用户ID','用户名','用户类型','用户电话','电子邮箱','公司名称','招募用户','分享次数','投票数']
  			results[:data] = [].tap do |cell|
  				designs.find_each do |design|
  					cell << [design.id,
  									 design.created_at.strftime("%Y-%m-%d %H:%M:%S"),
  									 design.title,
  									 design.try(:recommend_color_category1),
  									 design.user.id,
  									 design.user.display_name,
  									 design.user.role_chn_name,
                     design.user.phone,
                     design.user.email,
  									 design.user.try(:name_of_company),
  									 design.user.is_imported?,
  									 design.shares_count,
  									 design.votes_count]
  				end
  			end
  		end
  	end

  	def search_for_seller_datas(args)
  		area = Area.find_by_id args[:area_id]
  		area_ids = area.nil? ? [] : area.self_and_descendants.map(&:id)
  		companies = User.where("area_id in (?) and role_id = ?", area_ids, 2).order("is_top desc","top_order asc") 
  	
  		{}.tap do |results|
  			results[:columns] =  ['公司名称','开户时间','公司电话','公司邮箱','累计上线数','累计销售额','累计作品数','累计被投票数','累计被评论数','是否置顶','入选每周之星']
  			results[:data] = [].tap do |cell|
  				companies.find_each do |user|
  					is_weekly_start = ""
						current_designs = Design.includes(:user).includes(:design_images).where('design_images.file_file_size > 0').where("users.id" => user.id)
  					
						WeeklyStar.find_each do |w|
							if w.author_url.match %r(user.id)
								is_weekly_start = "是"
							else
								is_weekly_start = "否"
							end	
						end

						user_sales = user.seller_datas.present? ? user.seller_datas.map(&:sales).delete_if {|sale| sale.nil?}.sum : 0

  					cell <<  [user.display_name,
											user.created_at.strftime("%Y-%m-%d"), 
											user.try(:phone),
											user.try(:email),
											user.try(:sign_in_count),							
											user_sales,
											current_designs.count,

											current_designs.sum(:votes_count),
											current_designs.map {|d| d.comments.count }.sum,

											user.try(:top_order),
											is_weekly_start]

  				end
  			end
  		end
  	end	
  end
end