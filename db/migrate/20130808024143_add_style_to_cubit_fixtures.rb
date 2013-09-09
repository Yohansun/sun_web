class AddStyleToCubitFixtures < ActiveRecord::Migration
  def change
  	add_column :cubit_fixtures, :style, :string
  end
end
