Icolor::Application.routes.draw do

  root :to => 'home#index'

  devise_for :users, :controllers => { :registrations => "users/register",
    :sessions => "users/sessions", :passwords => "users/passwords",
    :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    match "/users/complete" => "users/register#complete"
    match "/user/update" => "users/register#update"
    match "/users/suc_regist" => "users/register#suc_regist"
    match "/users/username_check" => "users/register#username_check"
    match "/users/passwords/send_suc" => "users/passwords#send_suc"
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
  match "/master_designs/:id/fullscreen" => "master_designs#fullscreen"

  #行业资讯
  match "/color_articles" => "color_articles#index"
  match "/articles" => "articles#index"
  match "/articles/:id" => "articles#show"

  #业主通道
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
  match "/weekly_stars" => "weekly_stars#index"
  match "/weekly_stars/:id" => "weekly_stars#show"
  match "/designs" => "designs#index"
  match "/designs/:id" => "designs#show"
  match "/designs_upload" => "designs#upload"
  match "/inspirations" => "inspirations#index"
  match "/inspirations/:id" => "inspirations#show"
  match "/inspiration/:id/fullscreen" => "inspirations#fullscreen"
  match "/inspirations_upload" => "inspirations#upload"

  #精彩活动
  match "/events" => "events#index"
  match "/events/:id" => "events#show"
  match "/designer_events" => "designer_events#index"
  match "/designer_events/:id" => "designer_events#show"
  match "/other_events" => "other_events#index"

  match "/info_list" => "function#infolist"
  match "/info" => "function#info"

  match "/industry_news/news" => "industry_news#news"

  #扩充magic_content
  scope "/admin/content", :module => "magic_content" do
    resources :subjects do
      resources :master_profiles
      resources :weekly_tips
      resources :master_designs
    end
  end

  devise_for :admins, :controllers => { :sessions => 'magic_admin/sessions' }
  mount MagicContent::Engine => '/admin/content', :as => 'magic_content'
  mount MagicAdmin::Engine => '/admin', :as => 'magic_admin'

end