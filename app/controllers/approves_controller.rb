class ApprovesController < ApplicationController
  def new
    @approve = Approve.new
  end
  
  def create
    @approve = Approve.new(params[:approve])
    if @approve.save
      redirect_to(root_path)
    else
      render :new
    end
  end
end
