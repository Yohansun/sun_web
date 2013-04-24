# encoding: utf-8

module MagicContent
  class SuitImagesController < BaseController
    skip_authorize_resource :only => [:index, :categories, :update_tags, :update_title, :destroy_image, :audited, :autocomplete, :up_down_page, :update_tags_suits]
    def index
      @images = DesignImage.available.where("design_images.imageable_type = 'MasterDesign' ")
      if params[:genre].present?
        if params[:genre] == 'yes_color' || params[:genre] == 'yes_update' || params[:genre] == 'no_update' || params[:genre] == 'edit_no_verify' || params[:genre] == 'color_no_edit' || params[:genre] == 'edit_no_color' || params[:genre] == 'edit_color' || params[:genre] == 'no_edit_color' || params[:genre] == 'no_audited'
          @images = DesignImage.search_with(params[:genre], 'last_updated_at', "", "")
        elsif params[:start_date] && params[:end_date]
          @images = DesignImage.search_with(params[:genre], params[:keywords], params[:start_date], params[:end_date])
        else
          @images = DesignImage.search_with(params[:genre], params[:keywords], "", "") if params[:keywords].present?
        end
      end
      @images = @images.group("imageable_id").page(params[:page]).per(8)
      if @images
        if @images.length % 8 == 0
          @page_count = @images.length / 8
        else
          @page_count = (@images.length / 8).to_i + 1
        end
      end
    end

    def categories
      @image = DesignImage.find(params[:suit_image_id])
      imageable_id = @image.imageable_id
      @images = DesignImage.find_all_by_imageable_id imageable_id
      @image_tag_ids = @image.tags.map &:image_library_category_id
      @categories = ImageLibraryCategory.where(parent_id: nil)
    end
    
    def update_tags_suits
      @image = DesignImage.find(params[:suit_image_id])
      imageable_id = @image.imageable_id
      @images = DesignImage.find_all_by_imageable_id(imageable_id) if imageable_id
      # if params[:area_id].blank?
      #   flash[:alert] = '区域信息不能为空'
      #   redirect_to main_app.image_library_categories_path(@image.id) and return
      # end
      if @images.any?
        @images.each do |image|
          image.area_id = params[:area_id]
          image.last_user_id = current_admin.id
          image.last_updated_at = Time.now
          logger.debug(params[:tags])
          if params[:tags].present?
            image.tags.each do |tag|
              unless params[:tags].include?("#{tag.image_library_category_id}")
                tag.delete
              end
            end
            image_tag_id = image.tags.map &:id
            params[:tags].each do |tag|
              unless image_tag_id.include?("#{tag}")
                ImageTag.create(image_library_category_id: tag, design_image_id: image.id)
              end
            end
            # ImageTag.destroy_all(["id in (?)", image.tags.map(&:id)])
            # params[:tags].each {|tag| image.tags << ImageTag.new(image_library_category_id: tag)}
          end
          if image.save
            flash[:notice] = '保存成功'
          else
            flash[:alert] = '保存失败'
          end
        end
      end
      redirect_to main_app.suit_image_categories_path(@image.id)
    end

    def audited
      @image = DesignImage.find(params[:suit_image_id])
      imageable_id = @image.imageable_id
      @images = DesignImage.find_all_by_imageable_id(imageable_id) if imageable_id
      if @images.any?
        @images.each do |image|
          image.last_user_id = current_admin.id
          image.last_updated_at = Time.now
          image.audited = true
          if image.save
            flash[:notice] = "审核成功！"
          else
            flash[:alert] = "审核未成功！#{@image.errors.full_messages}"
          end
        end
          if params[:genre].present?
            redirect_to image_libraries_path(:genre => params[:genre], :keywords => params[:keywords])
          else
            redirect_to image_libraries_path
          end
      end
    end

  end
end
