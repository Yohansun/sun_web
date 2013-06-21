# encoding: utf-8
class Baicheng::UploadContractController < ApplicationController
  layout 'baicheng'
  before_filter :find_user
  def index
  end
  
  def new
    
  end
  
  def create
    if current_user && (story_user = StoryUser.where(id: params[:story_user_id]).first)
      contract = Contract.new
      contract.u_id = story_user.user_id
      contract.story_id = story_user.story_id  
      contract.user_id = current_user.id
      if contract.save
        params[:contract_image_ids].each do |contract_image_id|
          contract_image = ContractImage.find(contract_image_id)
          contract_image.contract_id = contract.id
          contract_image.is_cover = true if params[:cover_image] && params[:cover_image].to_i == contract_image_id.to_i
          contract_image.save
        end  
        redirect_to stories_path(story_user.story_id)  
      end
    else 
      redirect_to root_path
    end
  end

end