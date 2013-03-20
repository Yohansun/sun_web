class CreateContracts < ActiveRecord::Migration
  def change
	create_table :contracts do |t|
    t.string :genre
    t.integer :u_id
    t.integer :story_id
    t.integer :user_id
	t.timestamps
	end
  end
end