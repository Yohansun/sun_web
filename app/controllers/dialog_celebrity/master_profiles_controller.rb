# encoding: utf-8
class DialogCelebrity::MasterProfilesController < ApplicationController
  include CommonModule
  before_filter :get_page_data,:only => [:celebrities,:maste_interviews]
  def celebrities
    @celebrities = MasterProfile.where(mtype: 1).order("updated_at desc")
    @banners = IBanner.page_name('名人在线').order("position ASC")
    @new_designs = IColumnData.where(i_column_type_id: 1).order("position asc")
  end

  def maste_interviews
    @masters = MasterProfile.unscoped.where(mtype: 0)
    if params[:board_id].present?
      @masters = @masters.where(:celebrity_content_board_id => params[:board_id].to_i)
    end
    if params[:tag].present?
      @masters = @masters.where(:nationality => params[:tag])
    end
    @masters = @masters.order("created_at desc").page(params[:page]).per(8)
    @banners = IBanner.page_name('名家设计').order("position ASC")
  end

  def master_interview
    @master = MasterProfile.find(params[:id])
    @last_masters = MasterProfile.unscoped.order("created_at desc").limit(4)
    @banners = IBanner.page_name('名人名家访谈页').order("position ASC")
  end
end
