class AddStoryTalkingIdToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :story_talking_id, :integer
  end
end
