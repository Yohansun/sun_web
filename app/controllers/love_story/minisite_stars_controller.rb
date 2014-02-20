# encoding: utf-8
class LoveStory::MinisiteStarsController < LoveStory::BaseController
  caches_action :index, :expires_in => 7.days
  def index
    username = ['wangfengbo','daikun','chenzhibin','wangxiaogen','heyongming','liyizhong','jianghuiting','liuweiting','xiaoaibin','zhenghong','zhengshufen','xieyingkai','youweizhuang','zhaomuhuan']
    @users = User.where("username in (?)",username).page(params[:page]).per(24)
  end
end
