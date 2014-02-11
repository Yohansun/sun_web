class AddPriceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :price, :string
  end
end
