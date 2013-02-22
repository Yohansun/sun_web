class AddPropertyNameToDesigns < ActiveRecord::Migration
  def change
  	 add_column :designs, :property_name, :string
  end
end
