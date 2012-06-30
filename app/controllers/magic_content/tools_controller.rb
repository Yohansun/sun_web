# -*- encoding : utf-8 -*-
module MagicContent
  class ToolsController < BaseController
  	action :all, :except => [:show]

  	def create
  		create! { main_app.tools_path }
  	end

  	def update
  		update! { main_app.tools_path }
  	end	

  	def destroy
  		destroy!{ main_app.tools_path }
  	end
  end
end

