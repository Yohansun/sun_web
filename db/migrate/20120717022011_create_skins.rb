class CreateSkins < ActiveRecord::Migration
  def change
    create_table :skins do |t|
    	t.integer :role_id
    	t.string  :user_ids    	

      t.timestamps
    end
  end
end
