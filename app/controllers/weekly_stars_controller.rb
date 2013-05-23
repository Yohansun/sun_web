# -*- encoding : utf-8 -*-
class WeeklyStarsController < ApplicationController
  DefaultActions = {
		:weekly_stars_week          => "每周之星",
		:weekly_stars_month_color   => "月度色彩之星",
		:weekly_stars_month_design  => "月度设计之星"
	}.freeze

  helper_method :star_blank?
 
	def download
		target_file = WeeklyStar.find(params[:id])
		image_paths = []

		target_file.weekly_star_uploads.tap do |weekly|
			weekly.collect {|x| image_paths << x.file.path if File.exists?(x.file.path)}
		end
		added_actions = DefaultActions.merge(:index => "每周之星")
		#防止传过来的值不一致造成对服务器的攻击
		raise "参数不包含在列表中" unless added_actions.keys.include?(params[:target].to_sym) 
		target_name = added_actions[params[:target].to_sym]

		find_or_build_zip_file("public/#{target_name}.zip",:ab_paths => image_paths,:cache_name => PinYin.permlink(target_name)) do |zfile|
			send_file zfile
		end

	rescue Exception => e
		respond_to do |format|
			format.html {render :text => %!<script>alert("#{e.message}");window.history.back(-1)</script>!}
		end
	end

  def index
    @title1,@title2 = "每周","之星"

    designs = WeeklyStar.order("published_at desc") || WeeklyStar.new
    star_type_id = WeeklyStar.get_star_type_id(@title="每周之星")

    @design = designs.where(star_type_id: star_type_id).first    
    design_id = @design.design_link.split("/").last
    @link_design = Design.find(design_id)

    #每周之星
    weekly_star = designs.where(star_type_id: 1).first

    # star_ids = []
    # 3.times do |t|
    #   star = WeeklyStar.where(star_type_id: t+1).order("published_at desc").first
    #   star_ids << star.id if star.present?
    # end  
    @elder_designs = WeeklyStar.where("id != ?", weekly_star.id).order("published_at desc").page(params[:page]).per(8)

    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
  end
  
	DefaultActions.each do |act,star_type|
		define_method(act) do
			#TODO
			star_type_id = WeeklyStar.get_star_type_id(star_type)
			#每周之星
			@design = WeeklyStar.order("published_at desc").find_by_star_type_id(star_type_id)
			design_id = @design.design_link.split("/").last
			@link_design = Design.find(design_id)

			@elder_designs = WeeklyStar.where("id != ?", @design.id).order("published_at desc").page(params[:page]).per(8) 
			@title = @title1 = star_type.dup
			@title1.delete!(@title2="之星")
			render "index"
		end
	end

  def show
    @design = WeeklyStar.find(params[:id])
    design_id = @design.design_link.split("/").last
    @link_design = Design.find design_id
    @tags = WeeklyStar.tag_counts_on(:tags)
    @comments = @link_design.comments.page params[:page]

    @prev_star = WeeklyStar.where("published_at < ?", @design.published_at).order("published_at desc").first
    @next_star = WeeklyStar.where("published_at > ?", @design.published_at).order("published_at desc").last
  end

  def fullscreen
    @design = WeeklyStar.find(params[:id])
    @design_next = WeeklyStar.where("id > ?",params[:id]).first
    render :layout => nil
  end

  def star_blank?(star_type)
    star_type_id = WeeklyStar.get_star_type_id star_type
    WeeklyStar.where(star_type_id: star_type_id).blank?
  end
end
