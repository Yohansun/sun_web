class ModifyPointExchangeField < ActiveRecord::Migration
  def up
  	add_column :point_exchanges, :point_user_id, :integer
  	rename_column :point_exchanges, :amount, :product_number
  end

  def down
  	remove_column :point_exchanges, :point_user_id
  	rename_column :point_exchanges, :product_number, :amount
  end
end
