class CreateYdaGames < ActiveRecord::Migration
  def change
    create_table :yda_games do |t|
    	t.string :name
    	t.string :school
    	t.string :specialty
    	t.string :grade
    	t.integer :paperwork_type
    	t.string :paperwork_no
    	t.string :mobile
    	t.string :address
    	t.string :city
    	t.string :country
    	t.string :postcode
    	t.string :email
      t.timestamps
    end
  end
end
