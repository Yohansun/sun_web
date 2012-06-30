class AddSellersColumnsToAdmins < ActiveRecord::Migration
  def change
  	add_column :admins, :area_id, :integer, :default => 0
  end
end