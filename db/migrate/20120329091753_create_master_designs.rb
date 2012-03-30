class CreateMasterDesigns < ActiveRecord::Migration
  def change
    create_table :master_designs do |t|

      t.integer :master_profile_id
      t.string :design_name
      t.text :design_intro

      t.integer :subject_id
      t.datetime :published_at

      t.timestamps
    end
  end
end
