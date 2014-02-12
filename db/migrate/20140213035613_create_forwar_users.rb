class CreateForwarUsers < ActiveRecord::Migration
  def change
    create_table :forwar_users do |t|
      t.string :username
      t.string :genre
      t.timestamps
    end
  end
end
