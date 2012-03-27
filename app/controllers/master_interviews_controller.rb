class MasterInterviewsController < ApplicationController
  def index
     @articles = Subject.content("MasterProfile").order("published_at DESC").page(params[:page]).per(5)  if Subject.content("MasterProfile")
   end

   def show
     @article = MasterProfile.find(params[:id])
   end
end
