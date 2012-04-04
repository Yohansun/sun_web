class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id #拥有该留言的用户
      t.integer :from_user_id #发表留言的用户
      t.text :content

      t.timestamps
    end
  end
end
