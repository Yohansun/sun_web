# -*- encoding : utf-8 -*-
module MagicContent
  class SkinKvUploadsController < BaseController
    def create
      newparams = coerce(params)
      @upload = SkinKvUpload.new(newparams[:upload])
      if @upload.save
        flash[:notice] = "Successfully created upload."
        respond_to do |format|
          format.json {render :json => { :result => 'success',
                                         :upload => "/admin/content/skin_kv_uploads/#{@upload.id}" } }
        end
      else
        render :action => 'new'
      end
    end

    def show
      @upload = SkinKvUpload.find(params[:id])
    end

    private
    def coerce(params)
      if params[:upload].nil?
        h = Hash.new
        h[:upload] = Hash.new
        h[:upload][:kv_thumb] = params[:Filedata]
        h[:upload][:kv_thumb].content_type = MIME::Types.type_for(h[:upload][:kv_thumb].original_filename).to_s
        h
      else
        params
      end
    end
  end
end