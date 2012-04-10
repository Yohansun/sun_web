class ChangeDesignThoughtOfColorDesigns < ActiveRecord::Migration
  def change
    remove_column :color_designs, :desigin_thought
    add_column :color_designs, :design_thought, :text
  end
end
