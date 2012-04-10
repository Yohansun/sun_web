Icolor::Application.routes.draw do

  root :to => 'home#index'

  resources :votes

  devise_for :users, :controllers => { :registrations      => "users/register",
                                       :sessions           => "users/sessions", :passwords => "users/passwords",
                                       :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    match "/users/complete" => "users/register#complete"
    match "/user/update" => "users/register#update"
    match "/users/suc_regist" => "users/register#suc_regist"
    match "/users/username_check" => "users/register#username_check"
    match "/users/passwords/send_suc" => "users/passwords#send_suc"
    match "/users/policy" => "users/register#policy"
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
  match "/articles/get_weekly_tips" => "articles#get_weekly_tips"
  match "/articles/:id" => "articles#show"

  #业主通道
  resources :faqs
  match "/faqs/get_weekly_tips" => "faqs#get_weekly_tips"
  match "/channel/access" => "channel#access"

  #实用工具
  match "/softwares/app" => "softwares#app"
  match "/softwares/case" => "softwares#case"
  match "/softwares/tools" => "softwares#tools"

  match "/contact" => "contact#index"

  #设计鉴赏
  match "/weekly_stars" => "weekly_stars#index"
  match "/weekly_stars/:id" => "weekly_stars#show"
  match "/weekly_stars/:id/fullscreen" => "weekly_stars#fullscreen"
  match "/designs" => "designs#index"
  match "/designs/:id" => "designs#show"
  match "/designs_upload" => "designs#upload"
  # get "/inspirations", :to => "inspirations#index"
  # match "/inspirations/:id", :to => "inspirations#show"
  # get "/inspirations/:id/fullscreen" => "inspirations#fullscreen"
  # match "/inspirations/new", :to => "inspirations#new"
  # post "/inspirations", :to => "inspirations#create"
  resources :inspirations
  match "/inspirations_upload" => "inspirations#upload"
  resources :comments
  match "/color_designs" => "color_designs#index"
  match "/color_designs/:id" => "color_designs#show"
  match "/color_designs/:id/fullscreen" => "color_designs#fullscreen"

  #精彩活动
  match "/events" => "events#index"
  match "/events/:id" => "events#show"
  match "/designer_events" => "designer_events#index"
  match "/designer_events/index_2" => "designer_events#index_2" #第二页的显示 5个站点
  match "/designer_events/kv" => "designer_events#kv" #第一列表也KV点击后的页面
  match "/designer_events/:id" => "designer_events#show"
  match "/designer_events/city/:city" => "designer_events#city"
  match "/other_events" => "other_events#index"
  match "/other_events/kv" => "other_events#kv"

  #客服信息
  match "/info_list" => "function#infolist"
  match "/info" => "function#info"

  match "/emagazine" => "function#emagazine" #电子杂志订阅
  match "/results" => "function#results" #导航栏搜索结果页面
  match "/rules" => "function#rules" #会员机制页面
  match "/state" => "function#state" #网站声明
  match "/suc_ins" => "function#suc_ins" #发布成功页面
  match "/suc_works" => "function#suc_works" #发布成功页面
  match "/token" => "function#token" #头像修改页面
  match "/design_zg" => "function#design_zg" #室内设计师从业资格权威认证考试安排
  match "/design_zg2" => "function#design_zg2"
  match "/edm_week" => "function#edm_week" #一周未来提醒EDM

  #漆光异彩
  match "/7-1" => "function#7-1"
  match "/7-2" => "function#7-2"
  match "/7-3" => "function#7-3"
  match "/color_signup" => "function#color_signup"
  match "/gift" => "function#gift"
  match "/design_signup" => "function#design_signup"

  #个人主页
  resources :users do
    match "update_suc" => "users#update_suc"
    #用户对内和对外的相关页面
    resources :events
    resources :faqs
    resources :inspirations do
      member do
        get :upload
        get :fullscreen
        match :inspiration_update
      end
    end
    resources :designs do
      member do
        get :upload
        get :fullscreen
        match :design_update
      end
    end
    resources :design_images
    resources :messages
    resources :site_messages
    resources :rank
    resource :avatar
  end

  #修改个人签名
  post "/users/:id/update_user_signature" => "users#update_user_signature"

  #扩充magic_content
  scope "/admin/content", :module => "magic_content" do
    resources :subjects do
      resources :master_profiles
      resources :weekly_tips
      resources :master_designs
      resources :color_designs
      resources :weekly_stars
    end
    resources :master_design_uploads
    resources :color_design_uploads
    resources :weekly_star_uploads
  end

  devise_for :admins, :controllers => { :sessions => 'magic_admin/sessions' }
  mount MagicContent::Engine => '/admin/content', :as => 'magic_content'
  mount MagicAdmin::Engine => '/admin', :as => 'magic_admin'

  #在线配色
  resources :mix_colors

  #认证考试
  resources :approves
end