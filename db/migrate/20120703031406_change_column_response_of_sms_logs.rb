class ChangeColumnResponseOfSmsLogs < ActiveRecord::Migration
  def change
  	change_column :sms_logs, :response, :text
  end
end