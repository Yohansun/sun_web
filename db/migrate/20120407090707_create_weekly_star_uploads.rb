class CreateWeeklyStarUploads < ActiveRecord::Migration
  def change
    create_table :weekly_star_uploads do |t|
      t.integer :weekly_star_id
      t.timestamps
    end
  end
end
