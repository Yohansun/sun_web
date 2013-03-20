class CreateContractImages < ActiveRecord::Migration
  def change
    create_table :contract_images do |t|
    	t.integer :contract_id
    	t.integer :user_id
    	t.boolean :is_cover, default: false
    	t.has_attached_file :file
      t.timestamps
    end
  end
end
