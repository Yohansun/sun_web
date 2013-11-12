# encoding: utf-8
class Huaxun::ExamplesController <  Huaxun::BaseController
  def index
    @examples = Example.where(is_save: true).order("updated_at desc").page(params[:page]).per(6)
  end

  def search
    @examples = Example.where(is_save: true)
    if params[:search_value].present?
      if params[:search_name] == "1"
        @examples = @examples.where("title like ?" ,"%#{params[:search_value]}%")
      else
        @examples = @examples.where("name like ?", "%#{params[:search_value]}%")
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

    if params[:top]
      @examples = @examples.where(top: true)
    end

    if params[:choice]
      @examples = @examples.where(choice: true)
    end
     @examples = @examples.where(updated_at: start_time.beginning_of_day..end_time.end_of_day).order("updated_at desc").page(params[:page]).per(6)
    render :index
  end

  def new
    @tags = ImageLibraryCategory.where(parent_id: 34)
  end

  def create_image
    img = Example.find params[:id] if params[:id]
    img = Example.new unless img
    img.img = params[:Filedata]
    if img.save
      respond_to do |format|
        format.json {render :json => { :result => 'success',
          :upload => example_path(img.id)} }
      end
    end
  end

  def create
    examp = Example.find params[:image_id]
    examp.is_save = true
    examp.top = true if params[:top]
    examp.choice = true if params[:choice]
    examp.title = params[:title]
    examp.name = params[:name]
    examp.url = params[:url]
    examp.style = params[:style]
    examp.votes_count = params[:votes_count] if params[:votes_count]
    examp.comment_count = params[:comment_count] if params[:comment_count]
    examp.shares_count = params[:shares_count] if params[:shares_count]
    examp.save
    redirect_to examples_path, notice: '案例新建成功!'
  end

  def edit
    @examp = Example.find params[:id]
    @tags = ImageLibraryCategory.where(parent_id: 34)
  end

  def update
    examp = Example.find params[:id]
    examp.is_save = true
    if params[:top]
      examp.top = true
    else
      examp.top = false
    end
    if params[:choice]
      examp.choice = true
    else
      examp.choice = false
    end
    examp.title = params[:title]
    examp.name = params[:name]
    examp.url = params[:url]
    examp.style = params[:style]
    examp.votes_count = params[:votes_count] if params[:votes_count]
    examp.comment_count = params[:comment_count] if params[:comment_count]
    examp.shares_count = params[:shares_count] if params[:shares_count]
    examp.save
    redirect_to examples_path, notice: '案例修改成功!'
  end

  def show
    @examples = Example.find(params[:id])
  end

  def del_examples
    if params[:id_arr].present?
      params[:id_arr].each do |id|
        examp = Example.find id
        examp.destroy
      end
    end
    respond_to do |format|
      format.json {render :json => { :result => 'success'} }
    end
  end

  def get_design
    designs = Design.where(id: params[:design_id])
    if designs.present?
      design = designs.first
      respond_to do |format|
        format.json {render :json => { :result => 'success', :comments_count => design.comments_count,
          :votes_count => design.votes_count,
          :shares_count => design.shares_count
          } }
      end
    else
      respond_to do |format|
        format.json {render :json => { :result => 'errors'} }
      end
    end
  end

  def up_design
    designs = Design.where(id: params[:id])
    if designs.present?
      design = designs.first
      design.votes_count = params[:votenum] if params[:votenum]
      design.shares_count = params[:forward] if params[:forward]
      design.save
      respond_to do |format|
        format.json {render :json => { :result => 'success'
          } }
      end
    else
      respond_to do |format|
        format.json {render :json => { :result => 'errors'} }
      end
    end
  end
end
