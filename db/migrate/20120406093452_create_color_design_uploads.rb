class CreateColorDesignUploads < ActiveRecord::Migration
  def change
    create_table :color_design_uploads do |t|
      t.integer :color_design_id
      t.timestamps
    end
  end
end
