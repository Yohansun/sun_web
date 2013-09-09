class AddUrlToIBanners < ActiveRecord::Migration
  def change
    add_column :i_banners, :url, :string
  end
end
