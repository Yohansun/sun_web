class ILifeInfo < ActiveRecord::Base
  has_attached_file :file,
		:styles => {
				:list_280x145 => "280x145#"
			},
		:url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
		:path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  before_create :randomize_file_name
  before_post_process :randomize_file_name

  scope :time_range, ->(start_date,end_date){where(:updated_at => start_date.to_time..end_date.to_time)}

	private
	  def randomize_file_name
	    unless file_file_name.nil?
	      extension = File.extname(file_file_name).downcase
	      self.file.instance_write(:file_name, "#{SecureRandom.hex(16)}#{extension}")

	      temp = self.file.queued_for_write[:original]
		    unless temp.nil?
		      geo = Paperclip::Geometry.from_file(temp)
		      self.image_width = geo.width
		      self.image_height = geo.height
		    end
	    end
	  end
end
