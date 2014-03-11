class AddRegAtMinisite2014ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reg_at_minisite2014, :boolean, dufault: 0
  end
end
