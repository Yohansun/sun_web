class CreateDialogCelebrityPages < ActiveRecord::Migration
  def change
    create_table :dialog_celebrity_pages do |t|
      t.string :edit_treasury_title

      t.boolean :last_celebrity, default: false
      t.boolean :last_master, default: false

      t.integer :celebrity_id
      t.integer :master_id

      t.timestamps
    end
  end
end
