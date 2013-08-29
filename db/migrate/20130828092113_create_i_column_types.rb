class CreateIColumnTypes < ActiveRecord::Migration
  def change
    create_table :i_column_types do |t|
    	t.string :name
    	t.string :name_code
    	
      t.timestamps
    end
  end
end
