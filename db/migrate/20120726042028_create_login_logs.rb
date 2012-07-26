class CreateLoginLogs < ActiveRecord::Migration
  def change
    create_table :login_logs do |t|
    	t.integer :user_id
    	t.datetime :current_sign_in_at
    	t.datetime :last_sign_in_at

    	t.string :current_sign_in_ip
    	t.string :last_sign_in_ip
    end
  end
end
