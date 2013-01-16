# -*- encoding : utf-8 -*-
module MagicContent
  class ImageLibrariesController < ApplicationController
    layout "magic_admin/application"

    before_filter :authenticate_admin!

    def current_ability
      @current_ability ||= AdminAbility.new(current_admin)
    end

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to "/admin", :alert => '您没有权限访问此页面！'
    end

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

    # def destroy
      # logger.debug("dsadsadsadsadsa321321321321321321321")
      # @image = DesignImage.find params[:id]
      # @image.destroy
      # redirect_to image_libraries_path
      # destroy!{ main_app.image_libraries_path }
    # end

    def delete_image
      @image = DesignImage.find params[:id]
      @image.destroy
      redirect_to main_app.image_libraries_path
    end

    def audited
      @image = DesignImage.find(params[:id])
      @image.audited = true
      if @image.save
        flash[:alert] = "审核成功！"
      else
        flash[:notice] = "审核未成功！"
      end
      redirect_to main_app.image_libraries_path
    end

    def update
      @image = DesignImage.find(params[:id])
      image_params = params[:design_image]
      @image.title = image_params[:title] if image_params[:title].present?
      3.times.each do |item|
        next if image_params["color#{item}".to_sym].blank?
        if ColorCode.find_by_code(image_params["color#{item}".to_sym])
          @image.send("color#{item}=", image_params["color#{item}".to_sym])
        end
      end
      @image.save
      redirect_to image_libraries_path
    end

    def autocomplete
      params[:num] = params[:num].gsub(/\W/, '') if params[:num].present?
      colors = ColorCode.where("code LIKE '%#{params[:num]}%'")
      render json: colors.map { |c| c.code }
    end

  end
end