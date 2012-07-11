module MagicContent
  class GiftsController < BaseController
    belongs_to :subject
   def create
      @gift = Gift.new(rebuild_params(params[:gift]))
      @gift.subject_id = params[:subject_id]
      create! do |success, failure|
        failure.html { render :action => 'new' }
        success.html { redirect_to subject_gifts_path }
      end
    end

    def update
      params[:gift] = rebuild_params(params[:gift])
      update! do |success, failure|
        failure.html { render :action => 'edit' }
        success.html { redirect_to subject_gifts_path }
    end
  end
  end
end
