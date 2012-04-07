class WeeklyStarUpload < ActiveRecord::Base
  belongs_to :weekly_stars
  has_attached_file :file, :styles => {:thumb => "105x97#", :slide => "550x365#", :slide_thumb => "205x138#",
                                       :fullscreen => "980x655>", :fullscreen_thumb => "100x120#"},
                    :whiny_thumbnails => true,
                    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
