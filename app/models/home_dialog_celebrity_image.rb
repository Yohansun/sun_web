class HomeDialogCelebrityImage < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :home_dialog_celebrity

  has_attached_file :thumb, :styles => { :thumb => "330x240#" },
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

end
