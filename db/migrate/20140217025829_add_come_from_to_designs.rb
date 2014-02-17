class AddComeFromToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :come_from, :string
  end
end
