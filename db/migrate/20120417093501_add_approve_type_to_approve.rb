class AddApproveTypeToApprove < ActiveRecord::Migration
  def change
  	add_column :approves, :approve_type, :integer
  end
end
