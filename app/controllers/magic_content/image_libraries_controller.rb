# -*- encoding : utf-8 -*-
module MagicContent
  class ImageLibrariesController < BaseController
    skip_authorize_resource :only => [:index, :categories, :update_tags]

    def index
      @images = DesignImage.available.page(params[:page])
      if params[:genre].present? 
        if params[:genre] == 'yes_update' || params[:genre] == 'no_update'
          @images = DesignImage.search(params[:genre], 'last_updated_at')
        else
          @images = DesignImage.search(params[:genre], params[:keywords]) if params[:keywords].present?
        end
      end
      @images = @images.page(params[:page]) if @images.present?
    end

    def categories
      # @image = DesignImage.find(params[:id])
      @categories = ImageLibraryCategory.where(parent_id: "0")
    end

    def update_tags
      image = DesignImage.find(params[:id])
      if image.update_attribute(:tags, params[:tags])
        flash[:notice] = "保存成功"
      else
        flash[:error] = "修改失败"
      end
      redirect_to main_app.categories_image_libraries_path
    end

    def update
      
    end

    def destroy
      
    end

  end
end