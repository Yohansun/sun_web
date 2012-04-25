class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
    	t.integer :user_id
    	t.integer :score_type
    	t.integer :status
    	t.string  :remark
      t.timestamps
    end
  end
end
