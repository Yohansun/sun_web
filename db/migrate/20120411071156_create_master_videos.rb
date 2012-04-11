class CreateMasterVideos < ActiveRecord::Migration
  def change
    create_table :master_videos do |t|
      t.string :py
      t.string :name
      t.text :intro

      t.timestamps
    end
  end
end
