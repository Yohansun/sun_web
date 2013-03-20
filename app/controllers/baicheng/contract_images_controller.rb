# encoding: utf-8
class Baicheng::ContractImagesController < ApplicationController
  def create
    if current_user
      @upload = ContractImage.new
      @upload.file = params[:Filedata]
      @upload.user_id = current_user.id
      if @upload.save
        session[:image_id] = @upload.id
        respond_to do |format|
          format.json {render :json => { :result => 'success',
            :upload => contract_image_path(@upload.id),
            :path =>  @upload.file.url(:spring_img)} }
        end
      end
    else
      redirect_to root_path
    end
  end

  def show
    @upload = ContractImage.find(params[:id])
  end
end
