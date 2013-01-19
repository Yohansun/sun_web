# -*- encoding : utf-8 -*-
module MagicContent
  class ImageLibrariesController < BaseController
    skip_authorize_resource :only => [:index, :categories, :update_tags, :update_title, :destroy_image, :audited, :autocomplete]

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
      @image = DesignImage.find(params[:image_library_id])
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

    def update_title
      @image = DesignImage.find(params[:image_library_id])
      image_params = params[:design_image]
      @image.title = image_params[:title] if image_params[:title].present?
      [1,2,3].each do |item|
        next if image_params["color#{item}".to_sym].blank?
        if ColorCode.find_by_code(image_params["color#{item}".to_sym])
          @image.send("color#{item}=", image_params["color#{item}".to_sym])
        end
      end
      if @image.save
        flash[:alert] = "保存成功"
      else
        flash[:alert] = "#{@image.errors.full_messages}"
      end
      redirect_to image_libraries_path
    end

    def autocomplete
      #image_library_id这个id没有用,为了满足magic_admin的需要,index页面的JS是个假id
      params[:num] = params[:num].gsub(/\W/, '') if params[:num].present?
      colors = ColorCode.where("code LIKE '%#{params[:num]}%'")
      render json: colors.map { |c| c.code }
    end

    def destroy_image
      @image = DesignImage.find(params[:image_library_id])
      if @image.destroy
        flash[:alert] = "删除成功"
      else
        flash[:alert] = "删除失败!#{@image.errors.full_messages}"
      end
      redirect_to main_app.image_libraries_path
    end

    def audited
      @image = DesignImage.find(params[:image_library_id])
      @image.audited = true
      if @image.save
        flash[:alert] = "审核成功！"
      else
        flash[:alert] = "审核未成功！#{@image.errors.full_messages}"
      end
      redirect_to main_app.image_libraries_path
    end

  end
end