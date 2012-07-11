Icolor::Application.routes.draw do

  resources :gifts, :only => [:index]
  match "/gift_list" => "gifts#index"

  root :to => 'home#index'

  resources :votes

  resources :yda_games, :only => [:create]

  devise_for :users, :controllers => { :registrations      => "users/register",
                                       :sessions           => "users/sessions", :passwords => "users/passwords",
                                       :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :seller_users, :controllers => { :sessions => "sellers/sessions"}

  devise_scope :seller_user do
    match "/jxs" => "sellers/sessions#new"
    match "/seller_user/seller_data" => "sellers/seller_data#index"
    match "/seller_user/seller_sms" => "sellers/seller_sms#index"
    match "/seller_user/sms" => "sellers/seller_sms#sms"
    match "/seller_user/seller_tool" => "sellers/seller_tool#index"
    match "/seller_user/update_seller_data" => "sellers/seller_data#update_seller_data"
    match "/seller_user/set_top" => "sellers/seller_data#set_top"
    match "/seller_user/apply_for_tools" => "sellers/seller_tool#apply_for_tools"
  end

  devise_scope :user do
    match "/users/complete" => "users/register#complete"
    match "/user/update" => "users/register#update"
    match "/users/suc_regist" => "users/register#suc_regist"
    match "/users/username_check" => "users/register#username_check"
    match "/users/passwords/send_suc" => "users/passwords#send_suc"
    match "/users/policy" => "users/register#policy"
  end

  get '/shares' => 'shares#index'

  post "/api/login" => "api#login"
  post "/api/create_user" => "api#create_user"

  #在线配色
  resources :mix_colors, :as => :pre_mix_colors

  #订阅电子期刊和在线客服
  post "/maillists" => "maillists#create"
  match "/site_messages" => "site_messages#create", via: :post, as: 'online_qa'

  #大师殿堂
  match "/master_interviews" => "master_interviews#index"
  match "/master_interviews/:id" => "master_interviews#show"
  resources :master_topics, :only => [:index, :show]
  match "/master_designs" => "master_designs#index"
  match "/master_designs/:id" => "master_designs#show"
  match "/master_designs/:id/fullscreen" => "master_designs#fullscreen"

  #行业资讯
  match "/color_articles" => "color_articles#index"
  match "/articles" => "articles#index"
  match "/articles/:id" => "articles#show"

  #业主通道
  resources :faqs
  match "/channel/access" => "channel#access"

  #实用工具
  match "/softwares/app" => "softwares#app"
  match "/softwares/case" => "softwares#case"
  match "/softwares/tools" => "softwares#tools"

  match "/contact" => "contact#index"

  #设计鉴赏
  resources :weekly_stars, :only => [:index, :show]
  match "/weekly_stars/:id/fullscreen" => "weekly_stars#fullscreen"
  match "/designs" => "designs#index"
  match "/designs/:id" => "designs#show"
  match "/designs_upload" => "designs#upload"

  #我型我秀
  match "/my_show" => "my_show#index"
  match "/my_show/autocomplete_username" => "my_show#autocomplete_username"

  resources :inspirations
  match "/inspirations_upload" => "inspirations#upload"
  resources :comments
  resources :reply_msgs
  match "/color_designs" => "color_designs#index"
  match "/color_designs/:id" => "color_designs#show"
  match "/color_designs/:id/fullscreen" => "color_designs#fullscreen"

  #精彩活动
  match "/events" => "events#index"
  match "/events/:id" => "events#show"
  match "/designer_events" => "designer_events#index"
  match "/designer_events/index_2" => "designer_events#index_2" #第二页的显示 5个站点
  match "/designer_events/kv" => "designer_events#kv" #第一列表也KV点击后的页面
  match "/designer_events/weibo" => "designer_events#weibo"
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
  match "/weibo_wall" => "function#weibo_wall" #首页微博资讯

  #漆光艺彩
  match "/art" => "function#art"
  match "/art/down_art_pdf" => "function#down_art_pdf"
  match "/7-1" => "function#7-1"
  match "/7-2" => "function#7-2"
  match "/7-3" => "function#7-3"
  match "/color_signup" => "function#color_signup"
  match "/gift" => "function#gift"
  match "/design_signup" => "function#design_signup"

  #我的报名活动
  match "/users/:user_id/events/my_event" => "events#my_event"
  # yda
  match '/yda' => 'yda#index'
  match '/yda/act' => 'yda#act'
  match '/yda/agenda' => 'yda#agenda'
  match '/yda/info' => 'yda#info'
  match '/yda/prize' => 'yda#prize'
  match '/yda/theme' => 'yda#theme'
  match '/yda/down_yda' => 'yda#down_yda'
  match '/yda/yda_past' => 'yda#yda_past'
  
  resources :weekly_tips, only: :index
  
  #个人主页
  resources :users do
    match "update_suc" => "users#update_suc"
    match '/designs/autocomplete_recommend_color' => 'designs#autocomplete_recommend_color'

    #社区绑定
    match "community" => "users#community"
    match "/community/binding_cancel" => "users#binding_cancel"

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
    member do
      get :omniauth_user
      post :update_user_role
    end
    resources :sys_msgs
    resources :moods
  end

  #修改个人签名
  post "/users/:id/update_user_signature" => "users#update_user_signature"

  #扩充magic_content
  scope "/admin/content", :module => "magic_content" do
    resources :weibo_items
    resources :site_messages
    resources :master_design_uploads
    resources :color_design_uploads
    resources :weekly_star_uploads
    resources :mix_colors
    resources :faqs
    resources :tools
    resources :gifts
    match '/color_codes/autocomplete_recommend_color' => 'color_codes#autocomplete_recommend_color'
    match '/stat' => 'stat#index', :as => 'stat'
    resources :my_show_settings
  end

  #扩充magic_admin
  scope "/admin", :module =>"magic_admin" do
    match '/users' => 'users#index'
    resources :seller_users
    match "/autocomplete_area" => 'seller_users#autocomplete_area'
  end

  devise_for :admins, :controllers => { :sessions => 'magic_admin/sessions' }
  mount MagicContent::Engine => '/admin/content', :as => 'magic_content'
  mount MagicAdmin::Engine => '/admin', :as => 'magic_admin'
  
  #认证考试
  resources :approves

  get "search" => "home#search"

  get "landing" => "lands#landing"

  #分享后积分添加
  post "scores/share_score" => "scores#share_score"

  get "areas" => "areas#index"
end
