class CreateMasterDesignUploads < ActiveRecord::Migration
  def change
    create_table :master_design_uploads do |t|
      t.integer :master_design_id

      t.timestamps
    end
  end
end
