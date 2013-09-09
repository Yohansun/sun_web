class AddVisibleToHomeKvs < ActiveRecord::Migration
  def change
    add_column :home_kvs, :visible, :boolean, default: true
    HomeKv.create!
  end
end
