Icolor::Application.routes.draw do

  root :to => 'home#index'

  devise_for :users, :controllers => { :registrations => "users/register", :sessions => "users/sessions" }
  devise_scope :user do
    match "/users/register/roles" => "users/register#roles"
    match "/users/suc_regist" => "users/register#suc_regist"
    match "/users/data_valid" => "users/register#data_valid"
  end

  #订阅电子期刊和在线客服
  post "/maillists" => "maillists#create"
  post "/site_messages" => "site_messages#create"

  #大师殿堂
  match "/master_interviews" => "master_interviews#index"
  match "/master_interviews/:id" => "master_interviews#show"
  match "/master_topics" => "master_topics#index"
  match "/master_topics/:id" => "master_topics#show"
  match "/master_designs" => "master_designs#index"
  match "/master_designs/:id" => "master_designs#show"

  #叶主通道
  match "/faqs" => "faqs#index"
  match "/faqs/:id" => "faqs#show"
  match "/channel/access" => "channel#access"
  match "/channel/service" => "channel#service"

  #实用工具
  match "/softwares/app" => "softwares#app"
  match "/softwares/case" => "softwares#case"
  match "/softwares/tools" => "softwares#tools"

  match "/contact" => "contact#index"

  #设计鉴赏
  match "/designs" => "designs#index"
  match "/designs/:id" => "designs#show"
  match "/inspirations" => "inspirations#index"
  match "/inspirations/:id" => "inspirations#show"
  match "/inspiration/:id/fullscreen" => "inspirations#fullscreen"

  #精彩活动
  match "/events" => "events#index"
  match "/events/:id" => "events#show"

  match "/info_list" => "function#infolist"
  match "/info" => "function#info"

  match "/industry_news/news" => "industry_news#news"

  devise_for :admins, :controllers => { :sessions => 'magic_admin/sessions' }
  mount MagicContent::Engine => '/admin/content', :as => 'magic_content'
  mount MagicAdmin::Engine => '/admin', :as => 'magic_admin'

end
