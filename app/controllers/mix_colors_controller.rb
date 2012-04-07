class MixColorsController < ApplicationController
  before_filter :find_user
  def new
    @mix_color = MixColor.new
  end
  
  def create
    @mix_color = MixColor.new(params[:mix_color])
    @mix_color.user_id = current_user.id
    if @mix_color.save
      redirect_to(root_path)
    else
      render :action => "new"
    end
  end
end
