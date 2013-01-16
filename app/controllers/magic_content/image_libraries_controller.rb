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
      @image = DesignImage.find params[:image_library_id]
      @categories = ImageLibraryCategory.where(parent_id: "0")
    end

    def update_tags
      image = DesignImage.find(params[:image_library_id])
      if image.update_attributes(tags: params[:tags], area_id: params[:area_id])
        flash[:alert] = "保存成功"
        redirect_to main_app.image_libraries_path
      else
        flash[:alert] = "保存失败, 区域信息不能为空"
        redirect_to main_app.image_library_categories_path(image)
      end
    end

    def update
      
    end

    def destroy
      
    end

  end
end