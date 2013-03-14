class Baicheng::WelcomeController < ApplicationController
  layout 'baicheng'

  def index
  end

  def show
    render "#{params[:page]}"
  end
end
