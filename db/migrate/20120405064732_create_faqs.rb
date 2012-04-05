class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.integer :user_id
      t.string :title
      t.text   :content

      t.timestamps
    end
  end
end
