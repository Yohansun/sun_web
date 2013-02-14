class AddPinyinToDesignImages < ActiveRecord::Migration
  def change
    add_column :design_images, :pinyin, :string
  end
end
