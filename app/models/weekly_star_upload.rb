class WeeklyStarUpload < ActiveRecord::Base
  belongs_to :weekly_star
  after_save :update_zip_cache
  after_destroy :update_zip_cache

  has_attached_file :file, :styles => {:thumb => "105x97#", :slide => "550x365#", :slide_thumb => "205x138#", :home_page1 => "380x365#",
                                       :fullscreen => "980x655>", :fullscreen_thumb => "100x120#"},
                    :whiny_thumbnails => true,
                    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  private
  def update_zip_cache
    Rails.cache.write("#{PinYin.permlink(weekly_star.star_type)}",false) if weekly_star.present?
  end
end
