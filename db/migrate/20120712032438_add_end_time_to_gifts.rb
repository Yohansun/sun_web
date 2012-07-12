class AddEndTimeToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :end_time, :datetime
  end
end
