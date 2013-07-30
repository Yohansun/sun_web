class HomeDesignShow < ActiveRecord::Base
  
  has_attached_file :file,
		:styles => {
				:list_200x260 => "200x260#",
				:list_80x80 => "80x80#"
			},
		:url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
		:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

	 before_create :randomize_file_name
	 before_post_process :randomize_file_name

	 scope :design_type, lambda{ |design_type| where(design_type: design_type)}
	 scope :position, lambda{ |position| where(position: position)}

private
  def randomize_file_name
    unless file_file_name.nil?
      extension = File.extname(file_file_name).downcase
      self.file.instance_write(:file_name, "#{SecureRandom.hex(16)}#{extension}")
    end
  end

end
