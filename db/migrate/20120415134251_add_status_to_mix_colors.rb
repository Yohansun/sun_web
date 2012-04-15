class AddStatusToMixColors < ActiveRecord::Migration
  def change
    add_column :mix_colors, :status, :integer
  end
end
