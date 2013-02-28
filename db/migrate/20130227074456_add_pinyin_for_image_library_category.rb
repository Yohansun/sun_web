class AddPinyinForImageLibraryCategory < ActiveRecord::Migration
  def up
    add_column :image_library_categories, :pinyin, :string
    add_index :image_library_categories, :pinyin
    ImageLibraryCategory.all.each do |item|
      item.update_attribute(:pinyin, PinYin.of_string(item.title[0]).first.to_s)
    end
  end

  def down
    remove_column :image_library_categories, :pinyin
    remove_index :image_library_categories, :pinyin
  end
end
