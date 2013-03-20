# encoding: utf-8
class Baicheng::ContractsController < ApplicationController
  layout 'baicheng'
  def new
    if current_user && params[:type]
      @contract = Contract.new
    else
      redirect_to root_path
    end
  end

  def create
    if current_user
      contract = Contract.new
      contract.genre = params[:genre]
      contract.u_id = params[:u_id] if params[:genre].to_i == 1
      contract.story_id = params[:story_id] if params[:genre].to_i == 1
      contract.u_id = params[:u_id2] if params[:genre].to_i == 2
      contract.user_id = current_user.id
      if contract.save
        params[:contract_image_ids].each do |contract_image_id|
          contract_image = ContractImage.find(contract_image_id)
          contract_image.contract_id = contract.id
          contract_image.is_cover = true if params[:cover_image] && params[:cover_image].to_i == contract_image_id.to_i
          contract_image.save
        end
        
        redirect_to design_works_path if params[:type] == "baicheng"
        redirect_to user_asks_path(current_user) if params[:type] == "prsonil" 
      end
    else 
      redirect_to root_path
    end
  end

  def get_user_story
    user = User.where("id = '#{params[:user_id]}'").first
    if user.present?
      story = Story.where(user_id: user.id)
      if story
        respond_to do |format|
          format.json {render :json => { :result => 'success',
            :story => story,
            :action => 'new'
            } }
        end
      else
        respond_to do |format|
          format.json {render :json => { :result => 'success',
            :action => 'new'
          } }
        end
      end
    else
      respond_to do |format|
        format.json {render :json => { :result => 'failed',
          :action => 'new' } }
      end
    end
  end
end
