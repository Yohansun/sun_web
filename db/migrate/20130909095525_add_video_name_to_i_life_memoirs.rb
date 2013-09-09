class AddVideoNameToILifeMemoirs < ActiveRecord::Migration
  def change
    add_column :i_life_memoirs, :video_name, :string
  end
end
