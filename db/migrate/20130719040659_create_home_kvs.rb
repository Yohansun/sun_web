class CreateHomeKvs < ActiveRecord::Migration
  def change
    create_table :home_kvs do |t|
      t.string :title
      t.string :url
      t.integer :position

      t.timestamps
    end
  end
end
