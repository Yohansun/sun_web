class AddColumnInterviewContentTypeToMasterProfiles < ActiveRecord::Migration
  def change
    add_column :master_profiles, :interview_content_type, :string
  end
end
