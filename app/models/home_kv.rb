#encoding: utf-8
class HomeKv < ActiveRecord::Base
  attr_accessible :position, :title, :url, :file

  has_many :kv_maps, :dependent => :destroy

  has_attached_file :file,
    :styles => {:big => "700x345#",:list =>"200x100#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  def get_geometry(path)
    begin
      Paperclip::Geometry.from_file(path).to_s
    rescue
      nil
    end
  end
end
