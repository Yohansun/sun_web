class MixColorsController < InheritedResources::Base
  before_filter :find_user
  def new
    @mix_color = MixColor.new
    @mix_size = MixColor.count
  end
  
  def create
    @mix_color = MixColor.new(params[:mix_color])
    @mix_color.user_id = current_user.id
    create! do |succ, fail|
      succ.js { render 'succ' }
      fail.js { render 'fail' }
    end
  end
end
