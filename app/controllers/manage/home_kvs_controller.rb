# encoding: utf-8
class Manage::HomeKvsController < Manage::BaseController

	def index
		if params[:sort].present?
			@kv = HomeKv.find_by_position(params[:sort])
		end
	end

	def create
		@upload = HomeKv.find_by_position(params[:sort])
		unless @upload.present?
    	@upload = HomeKv.new
    end
    @upload.file = params[:Filedata]
    @upload.position = params[:sort]
    if @upload.save
      flash[:notice] = "Successfully created upload."
      session[:image_id] = @upload.id
      respond_to do |format|
        format.json {render :json => { :result => 'success',
          :upload => home_kv_path(@upload.id),
          :path =>  @upload.file.url(:big)} }
      end
    end
  end

  def show
    @upload = HomeKv.find(params[:id])
    respond_to do |format|
    	format.js
    end
  end

  def delete_file
  	kv = HomeKv.find(params[:id])
  	kv.update_attribute(:file, nil)
  	redirect_to :back
  end

	def kv_insert
		if params[:insert].present? && params[:insert].to_i < 5
			@kv = HomeKv.new(position: params[:insert].to_i + 1)
			last_kv = HomeKv.find_by_position(5)
			HomeKv.where("position > ?",params[:insert]).each {|a| a.increment!(:position)}
			last_kv.destroy
			@kv.save
			redirect_to home_kvs_path(sort: @kv.position)
		else
			redirect_to home_kvs_path(sort: 5)
		end
	end

	def kv_update
		@kv_update = HomeKv.find(params[:id])
		if params[:position].present?
			HomeKv.where(position: params[:position]).update_all(position: params[:sort])
			@kv_update.update_attribute(:position, params[:position])
		else
			@kv_update.update_attributes(title: params[:title], url: params[:url])
		end

		respond_to do |format|
      format.js
    end
	end
end
