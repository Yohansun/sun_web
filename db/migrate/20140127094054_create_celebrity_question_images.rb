class CreateCelebrityQuestionImages < ActiveRecord::Migration
  def change
    create_table :celebrity_question_images do |t|
      t.references :resource,    :polymorphic => true
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end
end
