class YdaController < ApplicationController
	layout "yda"

	def index
	end

	def info
	end 

	def act
	end
	
	def agenda
	end
	
	def prize
	end

	def theme
	end

	def down_yda
		send_file "#{Rails.root}/public/system/game_detail.pdf"
	end

end
