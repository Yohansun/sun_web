# encoding: utf-8
module DesignImagesHelper
	def prefix_link
		ids = @category_ids.collect {|item| item[:id]}
		ids.fill('0').join('-')
	end

	def delete_link id, search_type = nil
		tag_ids = @ids.clone
		other_ids = @other_ids.clone
		case search_type
	    when :tag
				tag_ids[tag_ids.index(id.to_s)] = '0' if tag_ids.index(id.to_s).present?
	    else
	    	other_ids[other_ids.index(id.to_s)] = '0' if other_ids.index(id.to_s).present?
    end
		"#{tag_ids.join('-')}-#{other_ids.join('_')}"
	end

	def show_link id, search_type = nil
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
		area 			= @area if @area.present?

		pinyin 		= @pinyin if ('A'..'Z').include?(@pinyin)
		pinyin 		= id if search_type == :pinyin

		color 		= @color if ['橙色系', '小户型', '客厅', '简约'].include?(@color)
		color 		= id if search_type == :color

		subject 	= @subject if ['All', 'MasterDesign', 'WeekStart', 'ColorDesign'].include?(@subject)
		subject 	= id if search_type == :subject

		user_word = @search_word if @search_word.present?

		rank = @rank if @rank.present?
		rank 	= id if search_type == :rank

		"#{links.join('-')}-#{area}_#{pinyin}_#{color}_#{subject}_#{user_word}_#{rank}"
	end

end
