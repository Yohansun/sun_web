xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.data do
	@areas.each do |area|
		if area.root?
			xml.province :name => area.name do
				area.children.each do |child|
					xml.city :name => child.name do
						if child.children_count > 0
							child.children.each do |are|
								xml.area :name => are.name, :id => are.id do

								end
							end
						end
					end
				end
			end
		end
	end
end