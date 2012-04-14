class MixColorsController < InheritedResources::Base
  before_filter :find_user
  def new
    @mix_color = MixColor.new
    @mix_size = MixColor.count
  end
  
  def create
    @mix_color = MixColor.new(params[:mix_color])
    @mix_color.user_id = current_user.id if current_user
    if @mix_color.save
      flash[:mix_color] = true
      redirect_to "/mix_colors/new"
    end
  end
end
