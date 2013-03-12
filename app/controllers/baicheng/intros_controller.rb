class Baicheng::IntrosController < ApplicationController
  layout 'intros'

  def show
     render "#{params[:id]}"
  end
end
