class AddColumnsToMedia < ActiveRecord::Migration
  def change
    add_column :media,:email,:string,default: ""
    add_column :media,:mobile,:string,default: ""
  end
end
