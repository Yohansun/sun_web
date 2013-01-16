module MagicContent
  class ImageLibrariesController < BaseController
    skip_authorize_resource :only => [:index]

    def index
      @images = DesignImage.available#.page(params[:page])
      if params[:genre].present? 
        if params[:genre] == 'yes_update' || params[:genre] == 'no_update'
          @images = DesignImage.search(params[:genre], 'last_updated_at')
        else
          @images = DesignImage.search(params[:genre], params[:keywords]) if params[:keywords].present?
        end
      end
      @images = @images.page(params[:page]) if @images.present?
    end

    def update
      
    end

    def destroy
      
    end

  end
end