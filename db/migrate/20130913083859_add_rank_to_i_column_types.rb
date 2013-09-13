# -*- encoding : utf-8 -*-
class AddRankToIColumnTypes < ActiveRecord::Migration
  def change
    add_column :i_column_types, :rank, :integer
  end
end
