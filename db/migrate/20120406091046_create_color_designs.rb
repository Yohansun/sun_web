class CreateColorDesigns < ActiveRecord::Migration
  def change
    create_table :color_designs do |t|

      t.string :design_name
      t.string :author
      t.string :author_url
      t.string :company_name
      t.string :company_url     #公司主页
      t.string :company_address #公司地址
      t.string :project_name    #项目名称

      t.string :design_style # 风格
      t.string :design_color # 色系
      t.string :design_usage # 功能区

      t.text :design_intro #设计说明
      t.text :design_material #主要材料
      t.text :recommend_reason  #推荐理由

      t.integer :subject_id
      t.datetime :published_at

      t.timestamps
    end
  end
end
