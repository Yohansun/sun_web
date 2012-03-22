Icolor::Application.routes.draw do

  root :to => 'home#index'

  devise_for :users, :controllers => { :registrations => "users/register", :sessions => "users/sessions" }
  devise_scope :user do
    match "/users/register/roles" => "users/register#roles"
    match "/users/suc_regist" => "users/register#suc_regist"
    match "/users/data_valid" => "users/register#data_valid"
  end

  post "/maillists" => "maillists#create"
  post "/site_messages" => "site_messages#create"

  match "/master_hall/list" => "master_hall#list"
  match "/master_hall/master" => "master_hall#master"
  match "/master_hall/topics" => "master_hall#topics"
  match "/master_hall/topic" => "master_hall#topic"
  match "/master_hall/works_list" => "master_hall#works_list"
  match "/master_hall/works_detail" => "master_hall#works_detail"

  match "/channel/access" => "channel#access"
  match "/channel/faq" => "channel#faq"
  match "/channel/service" => "channel#service"

  match "/utility/app" => "utility#app"
  match "/utility/case" => "utility#case"
  match "/utility/tools" => "utility#tools"

  match "/contact" => "contact#index"

  match "/design_appreciation/design" => "design_appreciation#design"
  match "/design_appreciation/inspiration" => "design_appreciation#inspiration"
  match "/design_appreciation/upload" => "design_appreciation#upload_ins1"

  match "/activities/event" => "activities#event"

  match "/info_list" => "function#infolist"
  match "/info" => "function#info"

  match "/industry_news/news" => "industry_news#news"

  devise_for :admins, :controllers => { :sessions => 'magic_admin/sessions' }
  mount MagicContent::Engine => '/admin/content', :as => 'magic_content'
  mount MagicAdmin::Engine => '/admin', :as => 'magic_admin'

end
