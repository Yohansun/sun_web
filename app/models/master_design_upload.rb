class MasterDesignUpload < ActiveRecord::Base
  belongs_to :master_design

  has_attached_file :file, :styles => {:thumb => "105x97#", :slide => "550x365#",
    :fullscreen => "980x655>", :interview => "153x184#",
    :home_page => "380x170#",:home_page1 => "180x170#",:home_page3 => "380x365#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  def title
    self.master_design.design_name if self.master_design
  end
end