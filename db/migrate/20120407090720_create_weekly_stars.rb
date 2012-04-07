class CreateWeeklyStars < ActiveRecord::Migration
  def change
    create_table :weekly_stars do |t|

      t.string :design_name
      t.string :author
      t.string :author_url
      t.string :company_name
      t.string :company_url     #公司主页
      t.string :company_address #公司地址
      t.string :project_name    #项目名称

      t.text :design_intro #设计说明
      t.text :design_material #主要材料
      t.text :recommend_reason  #推荐理由

      t.string :design_style # 风格
      t.string :design_color
      t.string :design_usage

      t.integer :votes_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :shares_count, :default => 0

      t.integer :subject_id
      t.datetime :published_at

      t.timestamps
    end
  end
end
