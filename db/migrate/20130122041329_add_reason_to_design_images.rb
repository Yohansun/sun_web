class AddReasonToDesignImages < ActiveRecord::Migration
  def change
  	add_column :design_images, :reason, :text
  end
end
