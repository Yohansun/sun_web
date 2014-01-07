# -*- encoding : utf-8 -*-
require 'zip/zip'
class WeeklyStarsController < ApplicationController
  layout "home_manage"
  DefaultActions = {
		:weekly_stars_week          => "每周之星",
		:weekly_stars_month_color   => "月度色彩之星",
		:weekly_stars_month_design  => "月度设计之星"
	}.freeze

  before_filter :get_data

  helper_method :star_blank?

	def download
		target_file = WeeklyStar.find(params[:id]).weekly_star_uploads
		unless target_file.blank?
      zipfile_name = "#{Rails.root}/public/system/zip/weekly_star#{params[:id]}.zip"
      if File.exists?(zipfile_name)
        send_file zipfile_name
      else
        Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
          target_file.each do |filename|
            zipfile.add(filename.file_file_name, filename.file.path) if File.exists?(filename.file.path)
          end
        end
        send_file zipfile_name
      end
    else
      redirect_to :back
    end
	end

  def index
    @title1,@title2 = "每周","之星"

    @banners = IBanner.page_name('设计之星').order("position ASC").all
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
    @elder_designs = WeeklyStar.where("id != ?", weekly_star.id).order("published_at desc").page(params[:page]).per(9)
    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
  end

	DefaultActions.each do |act,star_type|
		define_method(act) do
			#TODO
			star_type_id = WeeklyStar.get_star_type_id(star_type)
      @banners = IBanner.page_name('设计之星').order("position ASC").all
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
    @banners = IBanner.page_name('设计鉴赏内页').order("position ASC").all
    @design = WeeklyStar.find(params[:id])
    design_id = @design.design_link.split("/").last
    @link_design = Design.find design_id
    @tags = WeeklyStar.tag_counts_on(:tags)
    @comments = @link_design.comments.page params[:page]

    @prev_star = WeeklyStar.where("published_at < ?", @design.published_at).order("published_at desc").first
    @next_star = WeeklyStar.where("published_at > ?", @design.published_at).order("published_at desc").last

    @design_name = @design.design_name
    @company_name = @design.company_name
    @author = @design.author
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

  def get_data
    #大师访谈
    @master_interviews = IColumnData.show_data(6).limit(5)
    @master_more = IColumnData.where(i_column_type_id: 6,position: 0).first
    #相关资讯
    @about_info = IColumnData.show_data(7).limit(5)
    @more_info = IColumnData.where(i_column_type_id: 7,position: 0).first
  end
end
