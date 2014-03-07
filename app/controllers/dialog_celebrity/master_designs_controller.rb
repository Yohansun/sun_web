# encoding: utf-8
class DialogCelebrity::MasterDesignsController < ApplicationController
  def show
    @master_design = MasterDesign.find(params[:id])
    @upload = MasterDesignUpload.find(params[:upload_id])
    @master = @master_design.master_profile
    @banners = IBanner.page_name('名人名家作品页').order("position ASC")
    @new_designs = IColumnData.where(i_column_type_id: 1).order("position asc")
  end

  def download
    upload = MasterDesignUpload.find(params[:id])
    if upload
      send_file upload.file2.path(:slide)
    else
      render nothing: true, status: 404
    end
  end

end


  # create_table "i_column_data", :force => true do |t|
  #   t.string   "title"
  #   t.string   "url"
  #   t.integer  "rank"
  #   t.integer  "position"
  #   t.integer  "i_column_type_id"
  #   t.integer  "image_width"
  #   t.integer  "image_height"
  #   t.string   "file_file_name"
  #   t.string   "file_content_type"
  #   t.integer  "file_file_size"
  #   t.datetime "file_updated_at"
  #   t.datetime "created_at",        :null => false
  #   t.datetime "updated_at",        :null => false
  # end