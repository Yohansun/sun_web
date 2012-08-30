class CreatePhoneExpenses < ActiveRecord::Migration
  def change
    create_table :phone_expenses do |t|

    	t.float :user_id, default: 0
    	t.float :register, default: 0
    	t.float :design, default: 0
    	t.float :vote, default: 0
    	t.float :comment, default: 0
    	t.float :share, default: 0
    	t.float :inspiration, default: 0
    	t.float :total, default: 0

      t.timestamps
    end
  end
end
