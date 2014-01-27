class DialogCelebrityPage < ActiveRecord::Base
  attr_accessible :edit_treasury_thumb,:edit_treasury_title, :last_celebrity, :celebrity_id, :last_master, :master_id,:edit_treasury_url
  belongs_to :celebrity, class_name: MasterProfile, :foreign_key => :celebrity_id
  belongs_to :master,    class_name: MasterProfile, :foreign_key => :master_id

  has_attached_file :edit_treasury_thumb, :styles => { :thumb => "330x240>" },
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
