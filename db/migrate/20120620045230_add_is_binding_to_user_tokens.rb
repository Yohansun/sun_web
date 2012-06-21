class AddIsBindingToUserTokens < ActiveRecord::Migration
  def change
  	add_column :user_tokens, :is_binding, :boolean, :default => false
  end
end
