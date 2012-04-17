class AddMasterNameToMasterDesigns < ActiveRecord::Migration
  def change
    add_column :master_designs, :master_name, :string #不在大师访谈中出现过的大师
  end
end
