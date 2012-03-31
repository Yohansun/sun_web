class CreateWeeklyTips < ActiveRecord::Migration
  def change
    create_table :weekly_tips do |t|

      t.text :body
      t.string :week
      t.datetime :published_at
      t.integer :subject_id
      t.timestamps
    end
  end
end