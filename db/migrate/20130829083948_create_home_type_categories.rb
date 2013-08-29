class CreateHomeTypeCategories < ActiveRecord::Migration
  def change
    create_table :home_type_categories do |t|
    	t.integer :tag
    	t.references :tagable, :polymorphic => {:default => 'HomeType'}

	    t.timestamps
    end
  end
end
