# -*- encoding : utf-8 -*-
module MagicAdmin
  class UsersController < BaseController
    def index
    	if params[:search]
        @from = Time.new(params[:search]['created_at_from(1i)'],
          params[:search]['created_at_from(2i)'], params[:search]['created_at_from(3i)'])
        @to = Time.new(params[:search]['created_at_to(1i)'],
          params[:search]['created_at_to(2i)'], params[:search]['created_at_to(3i)'])

        @users = User.where("created_at >= '#{@from}' AND created_at <= '#{@to}'")
      end
    end
  end
end