class AddBudgetToStories < ActiveRecord::Migration
  def change
    add_column :stories, :budget, :string
    add_column :stories, :demand, :text
    add_column :stories, :is_save, :boolean
  end
end
