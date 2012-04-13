class AddColumnReasonToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :reason, :text
  end
end
