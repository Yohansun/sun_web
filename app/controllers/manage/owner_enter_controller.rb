class Manage::OwnerEnterController  < Manage::BaseController
  layout "manage"

  def index
  	@news = OwnerEnter.order("order_id asc")
  end

  def edit
    @new = OwnerEnter.find params[:id]
  end

  def update
  	if params[:current_id] == params[:new]
      @new = OwnerEnter.find params[:id]
      @new.title = params[:title] if params[:title]
      @new.content = params[:content] if params[:content]
      @new.link = params[:link] if params[:link]
    else
      if params[:id] == "1"
        @elsenew = OwnerEnter.find(2)
      else
        @elsenew = OwnerEnter.find(1)
      end 
      @elsenew.order_id = params[:current_id] if params[:current_id]
      @elsenew.save
      @new = OwnerEnter.find params[:id]
      @new.order_id = params[:new] if params[:new]
      @new.title = params[:title] if params[:title]
      @new.content = params[:content] if params[:content]
      @new.link = params[:link] if params[:link]
    end
    redirect_to owner_enter_index_path if @new.save
  end

end
