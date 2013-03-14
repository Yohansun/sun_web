class CreateBaichengEvents < ActiveRecord::Migration
  def change
    create_table :baicheng_events do |t|
      t.integer  :eventable_id
      t.string   :eventable_type
      t.timestamps
    end
    add_index :baicheng_events, [:eventable_type, :eventable_id]
  end
end
