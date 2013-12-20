# encoding: utf-8
class Manage::KvMapsController < Manage::BaseController

	def create
		@kv_map = KvMap.create(params[:kv_map])
		@kv = HomeKv.find_by_id(params[:kv_map][:home_kv_id])
    @event_kv = EventKv.find_by_id(params[:kv_map][:event_kv_id])
		create! do |format|
			format.js
		end
	end

	def destroy
    kv_map = KvMap.find(params[:id])
    @remove_id = kv_map.id

    destroy! do |format|
    	format.js
    end
  end
end
