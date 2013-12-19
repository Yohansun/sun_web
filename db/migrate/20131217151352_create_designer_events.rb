class CreateDesignerEvents < ActiveRecord::Migration
  def change
    create_table :designer_events do |t|
      t.string :start_time
      t.datetime :end_time
      t.string :title
      t.string :intro
      t.text :content
      t.boolean :is_save, default: 0
      t.has_attached_file :file

      t.timestamps
    end
  end
end
