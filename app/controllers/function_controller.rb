class FunctionController < ApplicationController
  def emagazine
    render :layout => nil
  end
  def edm_week
    render :layout => nil
  end

  def color_signup
  	@approve = Approve.new
  end
end
