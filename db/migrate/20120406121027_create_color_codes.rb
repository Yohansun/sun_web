class CreateColorCodes < ActiveRecord::Migration
  def change
    create_table :color_codes do |t|
      t.string :code
      t.string :name
      t.string :rgb

      t.timestamps
    end
  end
end
