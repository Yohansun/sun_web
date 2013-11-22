# encoding: utf-8
class Huaxun::HxMapsController < Huaxun::BaseController

  def create
    @kv = HxKv.find_by_id(params[:hx_map][:hx_kv_id])
    hx_map = HxMap.new(params[:hx_map])
    if hx_map.save
      respond_to do |f|
        f.js
      end
    else
      render js: "alert('#{hx_map.errors.full_messages}')"
    end
  end

  def destroy
    hx_map = HxMap.find(params[:id])
    hx_map.destroy if hx_map
    @remove_id = hx_map.id
  end
end
