class ChangeColorDesigns < ActiveRecord::Migration
  def change
    remove_column :color_designs, :author
    remove_column :color_designs, :author_url
    remove_column :color_designs, :company_name
    remove_column :color_designs, :company_url
    remove_column :color_designs, :company_address
    remove_column :color_designs, :project_name
    remove_column :color_designs, :design_intro
    remove_column :color_designs, :design_material
    remove_column :color_designs, :recommend_reason

    add_column :color_designs, :recommend_color, :string     #推荐色
    add_column :color_designs, :desigin_thought, :string     #设计理念

  end
end