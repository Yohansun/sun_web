class AddMinisiteIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :minisite_id, :integer
  end
end
