class AddNoauditedToDesignImages < ActiveRecord::Migration
  def change
  	add_column :design_images, :no_audited, :boolean, default: false
  end
end
