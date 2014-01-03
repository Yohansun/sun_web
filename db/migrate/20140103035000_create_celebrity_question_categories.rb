class CreateCelebrityQuestionCategories < ActiveRecord::Migration
  def change
    create_table :celebrity_question_categories do |t|
      t.string  :name, null: false
      t.integer :parent_id
      t.timestamps
    end
    add_index :celebrity_question_categories, :parent_id
  end
end
