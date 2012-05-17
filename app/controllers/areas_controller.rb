class AreasController < ApplicationController

	def index
		respond_to do |format| 
			format.xml {
				@areas = Area.all
				
			}
		end
	end
end
