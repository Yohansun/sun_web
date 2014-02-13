class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.string :username
      t.string :password
      t.text :boards
      t.timestamps
    end
  end
end
