# -*- encoding : utf-8 -*-
module HomeHelper
  def gsub_body_string(body_str, str_length)
    raw(truncate(strip_tags(body_str), :length => str_length))
  end

  def tag_name tag_id
  	result = ''
  	@image_library_category = ImageLibraryCategory.find_by_id(tag_id)
  	result = @image_library_category.title if @image_library_category.present?
  	result
  end

  def tag_link id, search_type = nil
  	id = id.to_i
		links = []
		@category_ids.each_with_index do |item, i|
			category_id = 0
			category_id = @ids[i] if @path.present?

			category_id = id if id == item[:id]

			child_ids = item[:childs].collect{|child| child[:child_ids] }
			category_id = id if child_ids.include?(id) if child_ids.any?

			child_child_ids = item[:childs].collect{|child| child[:child_child_ids] }.flatten
			category_id = id if child_child_ids.include?(id) if child_child_ids.any?

			links << category_id
		end

		area, pinyin, color, subject, search_word, user_word, rank = 0, 0, 0, 0, 0, 0, 0
		"#{links.join('-')}-#{area}_#{pinyin}_#{color}_#{subject}_#{user_word}_#{rank}"
	end

end
