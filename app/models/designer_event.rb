# encoding: utf-8
class DesignerEvent < ActiveRecord::Base
  attr_accessible :content, :end_time, :intro, :start_time, :title, :file, :is_save, :event_type

  scope :page_name, ->(controller_name){where(event_type: controller_name)}
  scope :recent_events,->{where("end_time >= ?", Time.now).order("end_time DESC")}
  scope :finished_events,->{where("end_time < ?", Time.now).order("end_time DESC")}
  scope :active_now, where("end_time >= ?", Time.now).order("end_time desc")
  scope :active_period, where("end_time < ?", Time.now).order("end_time desc")

  has_attached_file :file,
    :styles => {:list => "280x145#", :show => "700x300#",:big => "750x384#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

end
