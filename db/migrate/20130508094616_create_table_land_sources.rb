class CreateTableLandSources < ActiveRecord::Migration
  def change
    create_table :land_sources do |t|
      t.string  :site
      t.string  :code
      t.string  :position
      t.string  :path
      t.timestamps
    end
  end
end
