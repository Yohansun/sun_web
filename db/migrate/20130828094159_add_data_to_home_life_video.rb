class AddDataToHomeLifeVideo < ActiveRecord::Migration
  def change
  	HomeLifeVideo.create(:rank => 1, :position => 1)
  	HomeLifeVideo.create(:rank => 2, :position => 2)
  end
end
