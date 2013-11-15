class CreateWinnings < ActiveRecord::Migration
  def change
    create_table :winnings do |t|
      t.string :image_url
      t.string :url
      t.string :name
      t.string :centent
      t.string :genre
      t.string :area
      t.timestamps
    end
  end
end
