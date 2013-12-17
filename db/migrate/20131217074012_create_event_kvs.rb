class CreateEventKvs < ActiveRecord::Migration
  def change
    create_table :event_kvs do |t|
      t.string :url
      t.string :klass_name
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at

      t.timestamps
    end
  end
end
