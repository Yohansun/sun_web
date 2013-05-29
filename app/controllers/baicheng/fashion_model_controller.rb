# encoding: utf-8
class Baicheng::FashionModelController < ApplicationController
  layout 'baicheng'
  before_filter :find_user
  
  def index
    @title = "时尚榜样_装修设计作品活动主页-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "立邦iColor因爱之名刷新生活 时尚榜样平台，您可以看到设计师上传的设计作品及已选择房型平面图,更多家装需求，等待您的设计。"
    @key_words = '立邦刷新生活,装修设计作品,房型平面图'
  end
  
  def show
    @title = "时尚榜样_装修者评论平台-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "立邦iColor因爱之名刷新生活 装修者交流平台，可以发表设计需求，装修心得，发布爱情故事或爱的宣言，查看留言信息，查看设计师设计的作品。"
    @key_words = '装修者,装修心得,爱情故事,爱的宣言'
    
    if params[:id]=='native'
      @title = "时尚榜样_装修设计师评论平台-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
      @description = "立邦iColor因爱之名刷新生活 装修设计师交流平台，可以收到对装修设计作品的点评评论，查看留言和回复。"
      @key_words = '立邦刷新生活,装修设计师,装修点评,装修心得'
    end
  end

end
