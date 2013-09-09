class AddDataToHomeImageLibTags < ActiveRecord::Migration
  def change
  	HomeImageLibTag.create(:category_id => 34, :category_list => "35,36,38,39,40,41")
  	HomeImageLibTag.create(:category_id => 82, :category_list => "83,84,85,86,87,94")
  	HomeImageLibTag.create(:category_id => 1, :category_list => "2,3,4,5,6,7")
  	HomeImageLibTag.create(:category_id => 107, :category_list => "108,109,110,111,112,113")

  	HomeImageLibPhoto.create(title_limit: 22, dimensions: '408x244')
  	HomeImageLibPhoto.create(title_limit: 14, dimensions: '244x162')
  	HomeImageLibPhoto.create(title_limit: 9, dimensions: '162x162')
  	HomeImageLibPhoto.create(title_limit: 9, dimensions: '162x162')
  	HomeImageLibPhoto.create(title_limit: 14, dimensions: '244x162')
  	HomeImageLibPhoto.create(title_limit: 14, dimensions: '244x244')
  	HomeImageLibPhoto.create(title_limit: 9, dimensions: '162x244')
  end
end
