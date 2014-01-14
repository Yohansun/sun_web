class CreateCelebrityQuestions < ActiveRecord::Migration
  def change
    create_table :celebrity_questions do |t|
      t.string :name, null: false
      t.string :key, null: false
      t.string :content
      t.text   :reply_content
      t.string :image
      t.boolean :is_replied, default: false

      t.integer :asker_id
      t.integer :replier_id

      t.references :master_profile
      t.references :celebrity_content_board
      t.timestamps
    end
    add_index :celebrity_questions, :is_replied
    add_index :celebrity_questions, :asker_id
    add_index :celebrity_questions, :replier_id
    add_index :celebrity_questions, :master_profile_id
    add_index :celebrity_questions, :celebrity_content_board_id
  end
end
