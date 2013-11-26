class AddMoreUrlToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :more_url, :boolean, default: 0
  end
end
