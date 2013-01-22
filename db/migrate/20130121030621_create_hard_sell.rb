class CreateHardSell < ActiveRecord::Migration
  def change
    create_table :hard_sells do |t|
      t.datetime :date
      t.string :link
      t.string :num
      t.string :site
      t.string :feature
      
      t.timestamps
    end
  end
end