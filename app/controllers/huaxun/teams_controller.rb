# encoding: utf-8
class Huaxun::TeamsController < Huaxun::BaseController
  def index
    @teams = Team.where("is_save = 1").order("updated_at desc").page(params[:page]).per(10)
  end

  def search
    @teams = Team.where("is_save = 1")
    if params[:serch_value].present?
      if params[:serch_name] == "1"
        @teams = @teams.where(name: params[:serch_value])
      else
        @teams = @teams.where(job: params[:serch_value])
      end
    end
    if params[:start_time].present?
      start_time = DateTime.strptime(params[:start_time],'%Y-%m-%d')
    else
      start_time = DateTime.strptime("2010-01-01",'%Y-%m-%d')
    end
    if params[:end_time].present?
      end_time = DateTime.strptime(params[:end_time],'%Y-%m-%d')
    else
      end_time = Time.now
    end
    @teams = @teams.where(updated_at: start_time.beginning_of_day..end_time.end_of_day).order("updated_at desc").page(params[:page]).per(10)
    render :index
  end

  def create
    team = Team.find params[:image_id]
    team.name = params[:teams][:name]
    team.job = params[:teams][:job]
    team.url = params[:teams][:url]
    team.is_save = 1
    team.save
    redirect_to teams_path
  end

  def edit
   @team = Team.find params[:id]
  end

  def update
    team = Team.find params[:id]
    team.name = params[:teams][:name]
    team.job = params[:teams][:job]
    team.url = params[:teams][:url]
    team.save
    redirect_to teams_path
  end

  def create_image
    img = Team.find params[:id] if params[:id]
    img = Team.new unless img
    img.file = params[:Filedata]
    if img.save
      respond_to do |format|
        format.json {render :json => { :result => 'success',
          :upload => team_path(img.id),
          :path =>  img.file.url(:show)} }
      end
    end
  end

  def del_all
    if params[:id_arr].present?
      params[:id_arr].each do |id|
        team = Team.find id
        team.destroy
      end
    end
    respond_to do |format|
      format.json {render :json => { :result => 'success'} }
    end
  end

  def show
    @image = Team.find params[:id]
  end
end
