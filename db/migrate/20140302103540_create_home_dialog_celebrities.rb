class CreateHomeDialogCelebrities < ActiveRecord::Migration
  def change
    create_table :home_dialog_celebrities do |t|
      t.boolean :last_celebrity, default: false
      t.boolean :last_master, default: false

      t.integer :celebrity_id
      t.integer :master_id

      t.timestamps
    end
  end
end
