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
      @image_tag_ids = @image.tags.map(&:image_library_category_id)
      @categories = ImageLibraryCategory.where(parent_id: "0")
    end

    def update_tags
      @image = DesignImage.find(params[:image_library_id])
      if params[:tags].present?
        params[:tags].each do |tag|
          @image.tags << ImageTag.new(image_library_category_id: tag)
        end
      end
      @image.area_id = params[:area_id]
      @image.last_user_id = current_admin.id
      @image.last_updated_at = Time.now
      if @image.save
        flash[:notice] = "保存成功"
        if params[:genre].present?
          redirect_to image_libraries_path(:genre => params[:genre], :keywords => params[:keywords])
        else
          redirect_to image_libraries_path
        end
      else
        flash[:alert] = "保存失败, 区域信息不能为空"
        if params[:genre].present?
          redirect_to main_app.image_library_categories_path(image, :genre => params[:genre], :keywords => params[:keywords])
        else
          redirect_to main_app.image_library_categories_path(image)
      end
      end
    end

    def update_title
      error_color = []
      color = []
      @image = DesignImage.find(params[:image_library_id])
      image_params = params[:design_image]
      @image.last_user_id = current_admin.id
      @image.last_updated_at = Time.now
      @image.title = image_params[:title] if image_params[:title].present?
      @image.content = image_params[:content]
      @image.reason = image_params[:reason]
      [1,2,3].each do |item|
        if ColorCode.find_by_code(image_params["color#{item}".to_sym])
          @image.send("color#{item}=", image_params["color#{item}".to_sym])
          color.push(image_params["color#{item}".to_sym])
        elsif image_params["color#{item}".to_sym] == ""
          @image.send("color#{item}=", "")
        else
          error_color.push(image_params["color#{item}".to_sym])
          # flash[:notice] = "色号不正确"
        end
      end
      if @image.save
        str = ''
        if error_color.any?
          if error_color.length == 1 && color.length == 0
            str = error_color.first
            flash[:alert] = "您的色号: #{str} 错误,不能保存"
          else
            error_color.each {|color| str += color}
            flash[:notice] = "保存成功,忽略不正确的色号: #{str}"
          end
        else 
          flash[:notice] = "保存成功"
        end
      else
        flash[:alert] = "#{@image.errors.full_messages}"
      end
      if params[:genre].present?
        redirect_to image_libraries_path(:genre => params[:genre], :keywords => params[:keywords])
      else
        redirect_to image_libraries_path
      end
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
        flash[:notice] = "删除成功"
      else
        flash[:alert] = "删除失败!#{@image.errors.full_messages}"
      end
      if params[:genre].present?
        redirect_to image_libraries_path(:genre => params[:genre], :keywords => params[:keywords])
      else
        redirect_to image_libraries_path
      end
    end

    def audited
      @image = DesignImage.find(params[:image_library_id])
      @image.last_user_id = current_admin.id
      @image.last_updated_at = Time.now
      @image.audited = true
      if @image.save
        flash[:notice] = "审核成功！"
      else
        flash[:alert] = "审核未成功！#{@image.errors.full_messages}"
      end
      if params[:genre].present?
        redirect_to image_libraries_path(:genre => params[:genre], :keywords => params[:keywords])
      else
        redirect_to image_libraries_path
      end
    end

  end
end