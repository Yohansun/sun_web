# encoding: utf-8
class Huaxun::HxKvsController < Huaxun::BaseController

  def index
    if params[:position] && params[:position].to_i <= 9
      @kv = HxKv.find_or_create_by_position(params[:position])
    end
  end

  def create
    @upload = HxKv.find_or_initialize_by_position(params[:position])
    @upload.file = params[:Filedata]
    @upload.position = params[:position]
    if @upload.save
      flash[:notice] = "Successfully created upload."
      respond_to do |format|
        format.json {render :json => { :result => 'success',
                            :upload => hx_kv_path(@upload.id)}
                    }
      end
    end
  end

  def show
    @upload = HxKv.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def kv_update
    @kv = HxKv.find(params[:id])
    if params[:change_sort].present?
      HxKv.where(position: params[:change_sort]).update_all(position: params[:position])
      @kv.update_attribute(:position, params[:change_sort])
    else
      @kv.update_attribute(:url, params[:url])
    end

    render :kv_next and return if params[:next]
    render :kv_change_sort and return if params[:change_sort]
  end

  def kv_insert
    if HxKv.maximum(:position) < 9
      HxKv.find_each {|kv| kv.increment!(:position)}
      @kv = HxKv.create(position: 1)
      render js: "location.href='/huaxun/hx_kvs?position=1';"
    else
      render js: "alert('新建帧失败,当前总帧数已达到最大值9帧.');"
    end
  end

  def destroy
    @kv = HxKv.find(params[:id])
    if @kv
      HxKv.where(["position > ?", @kv.position]).each {|kv| kv.increment!(:position, by = -1)}
      @kv.destroy
    end
    render js: "location.reload();"
  end

end
