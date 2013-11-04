class CreateHxProfiles < ActiveRecord::Migration
  def change
    create_table :hx_profiles do |t|
      t.text :content

      t.timestamps
    end
  end
end
