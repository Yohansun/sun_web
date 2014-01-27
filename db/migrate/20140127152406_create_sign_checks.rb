class CreateSignChecks < ActiveRecord::Migration
  def change
    create_table :sign_checks do |t|
      t.integer :user_id
      t.boolean :prize, default: 0
      t.integer :date_at

      t.timestamps
    end
  end
end
