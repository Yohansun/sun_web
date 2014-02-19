class RemoveIndex < ActiveRecord::Migration
  def up
    remove_index :visit_ips, :created_at
    remove_index :visit_ips, :updated_at
    remove_index :avatars, :file_file_name
    remove_index :avatars, :file_updated_at
    remove_index :design_images, name: :source
    remove_index :designs, name: :NewIndex4
    remove_index :special_events, name: :index_special_events_on_start_at
    remove_index :designs, name: :NewIndex7
    remove_index :designs, name: :NewIndex10
    remove_index :hx_kvs, :created_at
    remove_index :hx_kvs, :updated_at
    remove_index :hx_maps, :hx_kv_id
    remove_index :hx_maps, :created_at
    remove_index :hx_maps, :updated_at
    remove_index :hx_news, :created_at
    remove_index :hx_news, :updated_at
    remove_index :inspirations, :votes_count
    remove_index :point_stores, :store_no
    remove_index :point_user_gifts, :user_id
    remove_index :point_user_gifts, :point_gift_id
    remove_index :point_user_gifts, :status
    remove_index :points, :expire_date
    remove_index :points, :user_id
    remove_index :seller_reports, :file_name
  end

  def down
  end
end
