class CreateSiteMessages < ActiveRecord::Migration
  def change
    create_table :site_messages do |t|
      t.text :desc
      t.timestamps
    end
  end
end

