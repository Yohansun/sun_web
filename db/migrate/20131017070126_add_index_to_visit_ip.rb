class AddIndexToVisitIp < ActiveRecord::Migration
  def change
    add_index :visit_ips, :ip
    add_index :visit_ips, :created_at
    add_index :visit_ips, :updated_at
  end
end
