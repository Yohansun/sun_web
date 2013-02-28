class CreateCubitFixtures < ActiveRecord::Migration
  def change
    create_table :cubit_fixtures do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :fixture_area
      t.string :fixture_type
      t.integer :area_id
      t.string :house_name
      t.string :pre_price

      t.timestamps
    end
  end
end
