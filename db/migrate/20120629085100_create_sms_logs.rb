class CreateSmsLogs < ActiveRecord::Migration
	def change
		create_table :sms_logs do |t|
			#短信发送信息
			t.integer :seller_user_id
			t.integer :user_id

    	#短信response信息
    	t.text   :content
    	t.string :response
    	t.string :send_id
    	t.string :result
    	t.string :description

    	t.timestamps
    end
  end
end