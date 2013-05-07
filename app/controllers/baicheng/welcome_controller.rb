# -*- encoding : utf-8 -*-
class Baicheng::WelcomeController < ApplicationController
  layout 'baicheng'

  def index
  	@title = "icolor刷新百城-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
  	@description = "icolor刷新百城活动，设计师上传家装设计作品，经评委评选后得出获奖名单。"
  end

  def show
  	@title, @description = "", ""
  	case params[:page]
  		when "jump"
  			@title = "大众用户轻松三级跳-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
	  		@description = "立邦icolor刷新百城设计案例征集评选活用户参与步骤，注册登录、免费咨询、参与活动。"
  		when "pk"
	  		@title = "家装公司设计师作品PK-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
	  		@description = "快速上传立邦icolor刷新百城设计案例征集评选活作品。"
            when "disclaimer"
              @title = ""
              @description = ""
  	end

    render "#{params[:page]}"
  end
end
