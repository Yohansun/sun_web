class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
    	t.string :source
    	t.string :source_ip
      t.timestamps
    end
  end
end
