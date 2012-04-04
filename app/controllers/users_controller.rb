class UsersController < ApplicationController
  def show
    redirect_to user_inspirations_path(params[:id])
  end

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

  def update_user_signature
    if params[:id]
      user = User.find(params[:id])
      user.signature = params[:value]
      if user.save
        render :text => user.signature
      end
    end
  end
end