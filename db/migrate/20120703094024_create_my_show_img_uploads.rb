class CreateMyShowImgUploads < ActiveRecord::Migration
  def change
    create_table :my_show_img_uploads do |t|

      t.timestamps
    end
  end
end