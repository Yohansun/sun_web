class HomeImageLibPhoto < ActiveRecord::Base
  
   has_attached_file :file,
		:styles => {
				:list_408x244 => "408x244#",
				:list_244x162 => "244x162#",
				:list_162x162 => "162x162#",
				:list_244x244 => "244x244#",
				:list_162x244 => "162x244#",
			},
		:url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
		:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

	 before_create :randomize_file_name
	 before_post_process :randomize_file_name

	 scope :find_id, lambda{ |id| where(id: id)}

private
  def randomize_file_name
    unless file_file_name.nil?
      extension = File.extname(file_file_name).downcase
      self.file.instance_write(:file_name, "#{SecureRandom.hex(16)}#{extension}")
    end
  end

end
