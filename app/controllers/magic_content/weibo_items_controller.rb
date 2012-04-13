# -*- encoding : utf-8 -*-
module MagicContent
  class WeiboItemsController < BaseController

    def create
      item = WeiboItem.find(params[:id])
      if item.status.nil?
        item.status = 1
      else
        item.status = nil
      end
      item.save
      create! do |success, failure|
        success.js { render 'create'}
        failure.js { render 'create'}
      end
    end

    def destroy
      destroy! do |success, failure|
        success.html { render :action => 'index'}
        failure.html { render :action => 'index'}
      end
    end
  end
end