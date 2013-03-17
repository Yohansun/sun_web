class CreateContracts < ActiveRecord::Migration
  def change
	create_table :contracts do |t|
    t.string :genre
    t.string :ask_name
    t.string :story_username
    t.string :story_title
    t.integer :contracttable_id
    t.string :contracttable_type
    t.integer :user_id
    t.boolean :is_cover, default: false
    t.has_attached_file :file
	t.timestamps
	end
  end
end
