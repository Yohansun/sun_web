class CreateHomeDialogCelebrityImages < ActiveRecord::Migration
  def change
    create_table :home_dialog_celebrity_images do |t|
      t.string   :thumb_file_name
      t.string   :thumb_content_type
      t.integer  :thumb_file_size
      t.datetime :thumb_updated_at

      t.integer :position, default: 0
      t.string  :title,    default: ""
      t.string  :url,      default: ""

      t.integer :home_dialog_celebrity_id
      t.timestamps
    end
  end
end
