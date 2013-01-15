module MagicContent
  class ImageLibrariesController < BaseController
    skip_authorize_resource :only => [:index]

    def index
      @images = DesignImage.available.page(params[:page])
    end

    def update
      
    end

    def destroy
      
    end

  end
end