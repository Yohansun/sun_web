class InspirationsController < ApplicationController
  def index 	
  	if params[:user_id]
  		@user = User.find(params[:user_id])
      @inspirations = @user.inspirations.page params[:page]
    	render :template => "#{controller_name}/users/#{action_name}"
    else
      @inspirations = Inspiration.page params[:page]
    end
  end

  def fullscreen
    render :layout => nil
  end
	
  def show
  	@inspiration = Inspiration.find(params[:id])
    @comments = @inspiration.comments.page params[:page]
  end

  def new
  	@inspiration = Inspiration.new
  end

  def create
  	@inspiration = Inspiration.new(params[:inspiration])
  	@inspiration.user_id = current_user.id
  	if @inspiration.save
  		if params[:user_id]
        Rails.logger.info params[:user_id]
  			redirect_to "/users/#{params[:user_id]}/inspirations"
  		else
  			redirect_to inspirations_path
  		end
  	else
  		redirect_to new_inspiration_path
  	end
  end
end
