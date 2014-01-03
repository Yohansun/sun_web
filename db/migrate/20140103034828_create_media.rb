class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.references :user
      t.timestamps
    end
    add_index :media, :user_id
  end
end
