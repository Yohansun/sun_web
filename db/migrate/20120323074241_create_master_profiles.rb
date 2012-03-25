class CreateMasterProfiles < ActiveRecord::Migration
  def change
    create_table :master_profiles do |t|
      t.string :name
      t.string :country
      t.string :master_field
      t.text :position
      t.text :interview_content
      t.text :message
      t.string :title
      t.text :intro

      t.integer :subject_id
      t.datetime :published_at

      t.timestamps
    end
  end
end
