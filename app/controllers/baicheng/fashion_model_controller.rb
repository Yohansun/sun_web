# encoding: utf-8
class Baicheng::FashionModelController < ApplicationController
  layout 'baicheng'
  before_filter :find_user
  def index
    @title = "时尚榜样_装修设计作品活动主页-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "立邦icolor因爱之名刷新生活 时尚榜样平台，您可以看到设计师上传的设计作品及已选择房型平面图,更多家装需求，等待您的设计。"
    @key_words = '立邦刷新生活,装修设计作品,房型平面图'
  end

end