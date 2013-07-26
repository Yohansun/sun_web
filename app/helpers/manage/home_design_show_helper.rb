#encoding: utf-8
module Manage::HomeDesignShowHelper

	def show_dimensions position
		result = case position
	    when 1 then
	    	"200x260"
	    else 
	    	"80x80"
    end
    result
	end

	def show_position position
		result = case position
	    when 1 then "左1"
	    when 2 then "右1"
	    when 3 then "右2"
	    when 4 then "右3"
	    else ""
    end
    result
	end

end
