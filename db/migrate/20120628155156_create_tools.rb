class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
    	t.string :name
    	t.integer :total, :default => 0
    	t.integer :has_applied, :default => 0
    	t.integer :subject_id 

      t.timestamps
    end
  end
end
