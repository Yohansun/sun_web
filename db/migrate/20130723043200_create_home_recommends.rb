class CreateHomeRecommends < ActiveRecord::Migration
  def change
    create_table :home_recommends do |t|
      t.integer :position
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
