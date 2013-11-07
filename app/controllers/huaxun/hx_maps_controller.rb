# encoding: utf-8
class Huaxun::HxMapsController < Huaxun::BaseController

  def create
    hx_map = HxMap.create(params[:hx_map])
    @kv = HxKv.find_by_id(params[:hx_map][:hx_kv_id])
  end

  def destroy
    hx_map = HxMap.find(params[:id])
    hx_map.destroy if hx_map
    @remove_id = hx_map.id
  end
end
