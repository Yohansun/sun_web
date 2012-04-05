class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string   "name"
      t.integer  "parent_id"
      t.boolean  "active",         :default => true
      t.string   "pinyin"
      t.integer  "children_count", :default => 0
      t.integer  "lft",            :default => 0
      t.integer  "rgt",            :default => 0
      t.timestamps
    end
  end
end