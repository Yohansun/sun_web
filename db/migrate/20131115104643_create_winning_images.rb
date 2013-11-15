class CreateWinningImages < ActiveRecord::Migration
  def change
    create_table :winning_images do |t|
      t.string :image_url
      t.integer :winning_id
      t.timestamps
    end
  end
end
