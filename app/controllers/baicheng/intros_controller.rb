class Baicheng::IntrosController < ApplicationController
  layout 'intros'
  def index
  end

  def show
  	 render "#{params[:id]}"
  end
end
