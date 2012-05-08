class AddDesignCountToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :design_count, :integer
  end
end
