# -*- encoding : utf-8 -*-
module MagicContent
  class ColorDesignUploadsController < BaseController
    def create
      newparams = coerce(params)
      @upload = ColorDesignUpload.new(newparams[:upload])
      if @upload.save
        flash[:notice] = "Successfully created upload."
        respond_to do |format|
          format.json {render :json => { :result => 'success',
                                         :upload => "/admin/content/color_design_uploads/#{@upload.id}" } }
        end
      else
        render :action => 'new'
      end
    end

    def show
      @upload = ColorDesignUpload.find(params[:id])
    end

    private
    def coerce(params)
      if params[:upload].nil?
        h = Hash.new
        h[:upload] = Hash.new
        h[:upload][:file] = params[:Filedata]
        h[:upload][:file].content_type = MIME::Types.type_for(h[:upload][:file].original_filename).to_s
        h
      else
        params
      end
    end
  end
end