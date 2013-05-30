# encoding: utf-8

module MagicContent
  class ImageLibrariesController < BaseController
    skip_authorize_resource :only => [:index, :categories, :update_tags, :update_title, :destroy_image, :audited, :autocomplete, :up_down_page, :no_audited]

    def index
      @images = DesignImage.available.order("design_images.id DESC")
      if params[:genre].present?
        if params[:genre] == 'yes_color' || params[:genre] == 'yes_update' || params[:genre] == 'no_update' || params[:genre] == 'edit_no_verify' || params[:genre] == 'color_no_edit' || params[:genre] == 'edit_no_color' || params[:genre] == 'edit_color' || params[:genre] == 'no_edit_color'
          @images = DesignImage.search_with(params[:genre], 'last_updated_at', "", "")
        elsif params[:start_date] && params[:end_date]
          @images = DesignImage.search_with(params[:genre], params[:keywords], params[:start_date], params[:end_date])
        else
          @images = DesignImage.search_with(params[:genre], params[:keywords], "", "") if params[:keywords].present?
        end
      end
      if @images
        if @images.count % 10 == 0
          @page_count = @images.count / 10
        else
          @page_count = (@images.count / 10).to_i + 1
        end
      end
      @images = @images.where("no_audited is false").order("design_images.id DESC").page(params[:page]) if @images.present?
    end

    def categories
      @image = DesignImage.find(params[:image_library_id])
      @image_tag_ids = @image.tags.map(&:image_library_category_id)
      @categories = ImageLibraryCategory.where(parent_id: nil)
    end

    def update_tags
      @image = DesignImage.find(params[:image_library_id])
      # if params[:area_id].blank?
      #   flash[:alert] = '区域信息不能为空'
      #   redirect_to main_app.image_library_categories_path(@image.id) and return
      # end
      @image.area_id = params[:area_id]
      @image.last_user_id = current_admin.id
      @image.last_updated_at = Time.now
      if params[:tags].present?
        ImageTag.destroy_all(["id in (?)", @image.tags.map(&:id)])
        params[:tags].each {|tag| @image.tags << ImageTag.new(image_library_category_id: tag)}
      end
      if @image.save
        flash[:notice] = '保存成功'
      else
        flash[:alert] = '保存失败'
      end
      redirect_to main_app.image_library_categories_path(@image.id)
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

      if params[:design_image][:edited_color]
        @image.edited_color = true
      elsif image_params[:color1_name]
        @image.edited_color = false
      end

      @image.color1_name = image_params[:color1_name]
      @image.color2_name = image_params[:color2_name]
      @image.color3_name = image_params[:color3_name]
      [1,2,3].each do |item|
        if item != 1
          if ColorCode.find_by_code(image_params["color#{item}".to_sym]) && image_params["color#{item}".to_sym].strip != image_params["color#{item-1}".to_sym].strip
            @image.send("color#{item}=", image_params["color#{item}".to_sym].strip)
            color.push(image_params["color#{item}".to_sym])
          elsif image_params["color#{item}".to_sym] == ""
            @image.send("color#{item}=", "")
          else
            error_color.push(image_params["color#{item}".to_sym])
            # flash[:notice] = "色号不正确"
          end
        else
          if ColorCode.find_by_code(image_params["color#{item}".to_sym])
            @image.send("color#{item}=", image_params["color#{item}".to_sym].strip)
            color.push(image_params["color#{item}".to_sym])
          else
            @image.color1 = image_params["color#{item}"]
            error_color.push(image_params["color#{item}".to_sym])
            # flash[:notice] = "色号不正确"
          end
        end
      end
      if @image.save
        str = ''
        if error_color.any? && !@image.edited_color
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
        redirect_to image_libraries_path(:genre => params[:genre], :keywords => params[:keywords], :page => params[:page])
      else
        redirect_to image_libraries_path(:page => params[:page])
      end
    end

    def autocomplete
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
        redirect_to image_libraries_path(:genre => params[:genre], :keywords => params[:keywords],page: params[:page])
      else
        redirect_to image_libraries_path(page: params[:page])
      end
    end

    def no_audited
      @image = DesignImage.find(params[:image_library_id])
      @image.last_user_id = current_admin.id
      @image.last_updated_at = Time.now
      @image.no_audited = true
      if @image.save
        flash[:notice] = "不予审核成功！"
      else
        flash[:alert] = "不予审核未成功！#{@image.errors.full_messages}"
      end
      # if params[:page].present?
        redirect_to image_libraries_path(:page => params[:page], :genre => params[:genre], :keywords => params[:keywords], :start_date => params[:start_date], :end_date => params[:end_date])
      # else
      #   redirect_to image_libraries_path
      # end
    end

    def up_down_page
      base_image = DesignImage.find(params[:image_library_id])
      @categories = ImageLibraryCategory.where(parent_id: nil)
      images = DesignImage.available.up_down_image(base_image.id)
      if params[:direction] == 'left'
        @image = images.size == 2 ? images[1] : nil
      else
        @image = images[0] if images.any?
      end
      @image_tag_ids = @image.tags.map(&:image_library_category_id) if @image
    end

  end
end
