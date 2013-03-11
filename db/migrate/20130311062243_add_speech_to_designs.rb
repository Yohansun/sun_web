class AddSpeechToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :speech, :text
  end
end
