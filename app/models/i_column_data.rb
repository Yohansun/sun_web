class IColumnData < ActiveRecord::Base
  belongs_to :i_column_type

  has_attached_file :file,
		:styles => {
				:list_155x115 => "155x115#"
			},
		:url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
		:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

	 before_create :randomize_file_name
	 before_post_process :randomize_file_name

	 scope :position, lambda{ |position| where(position: position)}
	 scope :show_data, lambda{ |i_column_type_id| where(i_column_type_id: i_column_type_id).where("position is null").order("rank asc")}

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
