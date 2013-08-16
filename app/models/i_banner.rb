class IBanner < ActiveRecord::Base
	belongs_to :i_banner_group
  
  has_attached_file :file,
		:styles => {
				:list_1000x85 => "1000x85#",
				:list_670x85 => "670x85#",
				:list_310x85 => "310x85#",
				:list_270x100 => "270x100#",
				:list_290x200 => "290x200#"
			},
		:url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
		:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

	 before_create :randomize_file_name
	 before_post_process :randomize_file_name

	 scope :position, lambda{ |position| where(position: position)}
	 scope :class_name, lambda{ |class_name| where(class_name: class_name)}

private
  def randomize_file_name
    unless file_file_name.nil?
      extension = File.extname(file_file_name).downcase
      self.file.instance_write(:file_name, "#{SecureRandom.hex(16)}#{extension}")
    end

    temp = self.file.queued_for_write[:original]
    unless temp.nil?
      geo = Paperclip::Geometry.from_file(temp)
      self.image_width = geo.width
      self.image_height = geo.height
    end

  end

end
