class AddDesignerIdListToCubitFixtures < ActiveRecord::Migration
  def change
    add_column :cubit_fixtures, :designer_id_list, :text
  end
end
