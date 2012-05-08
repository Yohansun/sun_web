# -*- encoding : utf-8 -*-
module MagicContent
  class WeiboItemsController < BaseController

    load_and_authorize_resource
    def index
      @weibo_items = WeiboItem.where("thumbnail_pic IS NOT NULL").order("created_time DESC")
      index!
    end

    def update
      @item = WeiboItem.find(params[:id])
      if @item.status.nil?
        @item.status = 1
      else
        @item.status = nil
      end
      @item.save
    end

    def destroy
      destroy! do |success, failure|
        success.html { render :action => 'index'}
        failure.html { render :action => 'index'}
      end
    end
  end
end