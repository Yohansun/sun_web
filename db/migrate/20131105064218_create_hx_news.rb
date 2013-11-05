class CreateHxNews < ActiveRecord::Migration
  def change
    create_table :hx_news do |t|
      t.integer :position
      t.string :title
      t.string :url

      t.timestamps
    end

    add_index :hx_news, :position
    add_index :hx_news, :created_at
    add_index :hx_news, :updated_at
  end
end
