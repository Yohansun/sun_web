# encoding: utf-8
class Manage::HomeLiterHeadsController < Manage::BaseController
  def index
    unless params[:design_type].present? 
      @liters = HomeLiterHead.order("order_id asc").where("genre = 0")
    else
      case params[:design_type]
      when "home_red_liters"
        @liters = HomeLiterHead.order("order_id asc").where("genre = ?", 0)
      when "home_black_liters"
        @liters = HomeLiterHead.order("order_id asc").where("genre = ?", 1)    
      when "home_color_liters"
        @liters = HomeLiterHead.order("order_id asc").where("genre = ?", 2)  
      when "home_type_liters"
        @liters = HomeLiterHead.order("order_id asc").where("genre = ?", 6)  
      when "home_style_liters"
        @liters = HomeLiterHead.order("order_id asc").where("genre = ?", 4)  
      when "home_cost_liters"
        @liters = HomeLiterHead.order("order_id asc").where("genre = ?", 3)  
      when "home_space_liters"
        @liters = HomeLiterHead.order("order_id asc").where("genre = ?", 5)  
      end
    end
  end 

  def edit
    @new = HomeLiterHead.find params[:id]
    @orders = HomeLiterHead.where("genre = ?", params[:genre]).map &:order_id
    @genre_type = @new.genre_type
    render :edit
  end

  def update
    @new = HomeLiterHead.find params[:home_liter_head_id]
    @new.title = params[:title] if params[:title]
    @new.link = params[:link] if params[:link]
    unless @new.order_id == params[:order_id].to_i
      genre = @new.genre
      @ano_new = HomeLiterHead.where(genre: genre, order_id: params[:order_id].to_i).first
      @ano_new.update_attributes(order_id: @new.order_id)
      @new.order_id = params[:order_id] if params[:order_id]
    end
    if @new.save
      render js: "alert('保存成功!');location.reload();"
    end
  end

  def insert_news
    @news = HomeLiterHead.order("order_id asc").where("genre = ?", params[:genre])
    @orders = HomeLiterHead.where("genre = ?", params[:genre]).map &:order_id
  end

  def create
    HomeLiterHead.order("order_id asc").where("genre = ?", params[:genre]).each do |image|
      unless image.order_id == 0
        image.order_id += 1
        image.save
      end
    end
    @image = HomeLiterHead.order("order_id asc").where("genre = ?", params[:genre]).last
    @image.title = params[:title]
    @image.link = params[:link]
    @image.order_id = 1
    redirect_to home_liter_heads_path(design_type:params[:design_type] ) if @image.save
  end

end
