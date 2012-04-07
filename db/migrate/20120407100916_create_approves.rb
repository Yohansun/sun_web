class CreateApproves < ActiveRecord::Migration
  def change
    create_table :approves do |t|
      t.string :name
      t.integer :id_type
      t.string :id_number
      t.string :telphone
      t.string :email
      t.string :address
      t.timestamps
    end
  end
end
