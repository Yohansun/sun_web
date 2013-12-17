class CreateCustomMeta < ActiveRecord::Migration
  def change
    create_table :custom_meta do |t|
      t.string :fullpath
      t.string :title
      t.string :description
      t.string :keywords

      t.timestamps
    end
  end
end
