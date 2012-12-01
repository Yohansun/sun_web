#encoding:utf-8

class DesignImage < ActiveRecord::Base
  attr_accessible :imageable_id, :imageable_type, :file

  belongs_to :imageable, :polymorphic => true

  # validate :file_dimensions, :unless => "errors.any?"

  has_attached_file :file,
    :styles => {:thumb => "60x45#", :index => "291x315#", :list => "188x214#",
        :inside => "188>", :outside => "202>", :home_page => "90>",
        :slide => "900>", :slide_thumb => "205x138#",
        :fullscreen => "980x655>", :fullscreen_thumb => "100x120#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

    def file_dimensions
      dimensions = Paperclip::Geometry.from_file(self.file.to_file(:original))
      if dimensions.width < 202
         errors.add(:file, '图片宽度必须大于202像素！')
      end
    end
end