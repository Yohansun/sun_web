# -*- encoding : utf-8 -*-
class Baicheng::IntrosController < ApplicationController
  layout 'intros'

  def show
  	@title, @description = "", ""
  	case params[:id]
      when "content"
        @title = "刷新百城”设计案例征集评选活动规则-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    	@description = "“刷新百城”设计案例征集评选活动规则， 所有活动的参与者必需是iColo网站的注册用户。 iColor将对参与评比的上传设计作品进行形式审查，不完整、不正确或不符合要求的将视为无效或作废，举办方有权取消其参与评比的资格。"
      when "award"
      	@title = "刷新百城”设计案例征集评选活动内容-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    	@description = "“刷新百城”设计案例征集评选活动内容，以“因爱之名，刷新生活”为主旨，讲述当代年轻人在成长中经历或见证的，关于家 • 刷新 • 爱情的故事，阐述家的刷新对于人生成长或爱情经历的重要性，传递对生活及家的美好向往。"
      when "detail"
      	@title = "刷新百城”设计案例征集评选活动评选细则-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    	@description = "“刷新百城”设计案例征集评选活动评选细则，评委评选：由国内外著名室内设计专家及立邦色彩组成（名单暂未定）。在每个城市参与活动的普通用户、设计师和家装公司中评选出获奖选手。"
      when "name"
      	@title = "刷新百城”设计案例征集评选活动评委名单-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    	@description = "立邦iColor刷新百城设计案例征集评选活动评委名单。"
    when "time"
    	@title = "刷新百城”设计案例征集评选活动时间-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    	@description = "立邦iColor刷新百城设计案例征集评选活动时间表。包括刷新百城设计案例征集评选时间，评选揭晓时间，奖品发送时间。"
    end
  	
    render "#{params[:id]}"
  end
end
