#encoding: utf-8
class Manage::SpecialKvController < Manage::BaseController

	def index
		@kv = HomeKv.where(position: nil).first
	end

	def create_image
    @kv = HomeKv.where(position: nil).first
    result = "上传失败"
    if @kv
  		@kv.file = params[:file].tempfile if params[:file].present?
    	if @kv.save
    		if params[:file].present?
  				result = "上传成功"
  			end
  		end
    end

    render :json => {:notify => "上传成功"}, :layout => false
  end

	def save_data
		if params[:id].present?
			@kv = HomeKv.find(params[:id])
			@kv.update_attributes(url: params[:url], visible: params[:visible])
		end
		render js: "alert('保存成功!');location.reload();"
	end
end
