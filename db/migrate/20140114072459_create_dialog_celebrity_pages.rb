class CreateDialogCelebrityPages < ActiveRecord::Migration
  def change
    create_table :dialog_celebrity_pages do |t|
      t.string :edit_treasury_thumb
      t.string :edit_treasury_title
      t.string :edit_treasury_url

      t.boolean :last_celebrity, default: false
      t.boolean :last_master, default: false

      t.references :celebrity
      t.references :master_profile

      t.timestamps
    end
  end
end
