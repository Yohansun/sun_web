class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :job
      t.string :url
      t.integer :is_save, :default => 0
      t.has_attached_file :file
      t.timestamps
    end
  end
end
