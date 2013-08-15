# encoding: utf-8
class Manage::FitLiteralsController < Manage::BaseController
  def index
  	@news = FitLiteral.order("order_id asc")
  end

  def edit
  	@new = FitLiteral.find params[:id]
    @orders = [1,2,3,4,5,6]
  	render :edit
  end

  def update
    @new = FitLiteral.find params[:fit_literal_id]
    @new.order_id = params[:order_id] if params[:order_id]
    @new.title = params[:title] if params[:title]
    @new.link = params[:link] if params[:link]
    if @new.save
      render js: "alert('保存成功!');location.reload();"
    end
  end

  def insert_news
    @new = FitLiteral.find_by_order_id 6
    @new.delete
    FitLiteral.find_each do |new|
      new.order_id += 1
      new.save
    end
    @news = FitLiteral.order("order_id asc")
  end
  
  def create
    FitLiteral.create :title => params[:title], :link => params[:link], :order_id => params[:order_id]
    redirect_to fit_literals_path
  end
end
