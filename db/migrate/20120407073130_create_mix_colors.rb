class CreateMixColors < ActiveRecord::Migration
  def change
    create_table :mix_colors do |t|
      t.text :description
      t.has_attached_file :mix_color_img
      t.integer :user_id
      t.timestamps
    end
  end
end
