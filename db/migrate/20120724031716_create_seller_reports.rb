class CreateSellerReports < ActiveRecord::Migration
  def change
    create_table :seller_reports do |t|
      t.string :file_name
      t.datetime :statistical_time
      t.datetime :created_time
      
      t.timestamps
    end
  end
end
