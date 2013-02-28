class CreateVisitIps < ActiveRecord::Migration
  def change
    create_table :visit_ips do |t|
      t.string :ip

      t.timestamps
    end
  end
end
