class UsersController < ApplicationController
  def update
    if current_user
      valid_result = current_user.errors.messages
      current_user.update_attributes(params[:user])

      @messages = ""
      if valid_result.size != 0
        valid_result.each do |key, value|
          @messages << "*" + value[0] + '\n'
        end
        return @messages
      end
    end
  end
end
