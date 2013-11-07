#encoding: utf-8
Icolor::Application.routes.draw do
  # match "/images/(:id)_:tags-:imageable_type-:ranking_list-:area_id-:pinyin-:search-:all_tags-:site" => "design_images#image_show"
  match "/images/:id/:site/*path" => "design_images#image_show"
  match "/images/:id/image_show" => "design_images#image_show", as: 'image_show_design_image'
  match "/images/:id/fullscreen" => "design_images#fullscreen"
  match "/images/:page/page" => "design_images#index"
  match "/images/*path/:page" => "design_images#index"
  match "/images/*path" => "design_images#index"
  match "/images" => "design_images#index"

  require 'api'
  resources :special_events do
    member do
      get  :show
      post :join
      post :blessing
      post :send_greeting_cards
      put  :check_mobile
      post :award
      post :weibo
    end
  end

  resources :gifts, :only => [:index]
  match "/gift_list" => "gifts#index"
  resources :winnings do
    collection do
      get :get_special
      get :get_network
    end
  end

  get "/shuaxin" => redirect("/shuaxin/index.html")
  get "/21days" => redirect("/21days/index.html")

  get "/users/me" => "users#me"
  get "/users/edit_me" => "users#edit_me"
  get "home/overall.js" => "home#overall"
  get "home/home_overall.js" => "home#home_overall"
  get "home/image_show_loading" => "home#image_show_loading"
  root :to => 'home#index'
  get "home/design_show"
  get "home/image_vote" => "home#image_vote"
  get "home/get_vote" => "home#get_vote"
  post "home/update_vote" => "home#update_vote"

  resources :votes

  resources :yda_games, :only => [:create]

  devise_for :users, :controllers => { :registrations      => "users/register",
    :sessions           => "users/sessions",
    :passwords          => "users/passwords",
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
    match "/seller_user/reports" => "sellers/seller_reports#index"
    match "/seller_user/reports/export" => "sellers/seller_reports#export"
    match "/seller_user/reports/export_all" => "sellers/seller_reports#export_all"
  end

  devise_scope :user do
    match "/huaxun/sign" => "huaxun/sessions#create"
    match "/huaxun/sign_out" => "huaxun/sessions#destroy"
    match "/users/complete" => "users/register#complete"
    match "/user/update" => "users/register#update"
    match "/users/suc_regist" => "users/register#suc_regist"
    match "/users/username_check" => "users/register#username_check"
    match "/users/passwords/send_suc" => "users/passwords#send_suc"
    match "/users/passwords/reset" => "users#reset_password"
    match "/users/policy" => "users/register#policy"
  end

  get '/shares' => 'shares#index'

  get "/api/baicheng_login" => "api#baicheng_login"
  get "/api/external_login" => "api#external_login"
  post "/api/login" => "api#login"
  post "/api/create_user" => "api#create_user"
  post "/api/update_user" => "api#update_user"

  #在线配色
  resources :mix_colors, :as => :pre_mix_colors

  #订阅电子期刊和在线客服
  post "/maillists" => "maillists#create"
  match "/site_messages" => "site_messages#create", via: :post, as: 'online_qa'

  #大师殿堂
  resources :master_interviews,:only => [:index,:show] do
    collection do
      get :all                                                  #所有
      get :oversea                                              #海外
      match "hk-tw-mc",:action => "hk_tw_mc",:as => "hk_tw_mc"  #港澳台
      get :cn                                                   #中国大陆
      get :shinei                                               #室内空间大师
      get :color                                                #色彩大师
    end
  end
  match "master_interviews/hk-tw-mc/:type" => "master_interviews#hk_tw_mc"
  match "master_interviews/hk_tw_mc/:type" => "master_interviews#hk_tw_mc"
  match "master_interviews/cn/:type"       => "master_interviews#cn"
  match "master_interviews/oversea/:type"  => "master_interviews#oversea"
  match "master_interviews/all/:type"      => "master_interviews#all"

  resources :master_topics, :only => [:index, :show]

  resources :master_designs ,:only => [:index,:show] do
    collection do
      get :all                                                  #所有
      get :oversea                                              #海外
      match "hk-tw-mc",:action => "hk_tw_mc",:as => "hk_tw_mc"  #港澳台
      get :cn                                                   #中国大陆
    end
    member do
      get :fullscreen
      get :download
    end
  end

  match "master_designs/hk-tw-mc/:type" => "master_designs#hk_tw_mc"
  match "master_designs/hk_tw_mc/:type" => "master_interviews#hk_tw_mc"
  match "master_designs/cn/:type"       => "master_designs#cn"
  match "master_designs/oversea/:type"  => "master_designs#oversea"
  match "master_designs/all/:type"      => "master_designs#all"



  #行业资讯
  match "/color_articles" => "color_articles#index"
  resources :articles,:only => [:index,:show]

  #业主通道
  resources :faqs
  match "/channel/access" => "channel#access"
  match "/channel/refresh_service" => "channel#refresh_service"

  #实用工具
  match "/softwares/app" => "softwares#app"
  match "/softwares/case" => "softwares#case"
  match "/softwares/tools" => "softwares#tools"

  match "/contact" => "contact#index"

  #设计鉴赏
  # resources :weekly_stars, :only => [:index, :show]
  #设计之星
  match "weekly_stars-design" => "weekly_stars#index"                             ,:as => "weekly_stars"
  #每周之星
  match "weekly_stars-week"   => "weekly_stars#weekly_stars_week"                 ,:as => "weekly_stars_week_weekly_stars"
  #月度色彩之星
  match "weekly_stars-month-color" => "weekly_stars#weekly_stars_month_color"     ,:as => "weekly_stars_month_color_weekly_stars"
  #月度设计之星
  match "weekly_stars-month-design" => "weekly_stars#weekly_stars_month_design"   ,:as => "weekly_stars_month_design_weekly_stars"
  resources :weekly_stars do
    member do
      get :download
    end
  end
  match "/weekly_stars/:id/fullscreen" => "weekly_stars#fullscreen"
  match "/designs" => "designs#index"
  match "/designs/:id" => "designs#show"
  post "/designs/story_talking/:id" => "designs#story_talking", as: "story_talking"
  match "/designs_upload" => "designs#upload"

  #我型我秀
  match "/my_show" => "my_show#index"
  match "/my_show/autocomplete_username" => "my_show#autocomplete_username"


  #最新
  match "inspirations-new"      => "inspirations#inspirations_new"          ,:as => "inspirations_new"
  #最热
  match "inspirations-hot"      => "inspirations#inspirations_hot"          ,:as => "inspirations_hot"
  #刷新21天
  match "inspirations-minisite" => "inspirations#inspirations_minisite"     ,:as => "inspirations_minisite"
  resources :inspirations do
    member do
      get :download
    end
  end
  match "/inspirations_upload" => "inspirations#upload"
  resources :comments do
    collection do
      get :get_comments
    end
  end
  resources :reply_msgs
  resources :rep_replies
  match "/color_designs" => "color_designs#index"
  match "/color_designs/:id" => "color_designs#show"
  match "/color_designs/:id/fullscreen" => "color_designs#fullscreen"
  match "/color_designs/:id/download" => "color_designs#download"


  #精彩活动
  match "/events" => "events#index"
  match "/events/:id" => "events#show"
  match "/designer_events" => "designer_events#index"
  match "/designer_events/index_2" => "designer_events#index_2" #第二页的显示 5个站点
  match "/designer_events/index_3" => "designer_events#index_3"
  match "/designer_events/kv" => "designer_events#kv" #第一列表也KV点击后的页面
  match "/designer_events/weibo" => "designer_events#weibo"
  match "/designer_events/:id" => "designer_events#show"
  match "/designer_events/city/:city" => "designer_events#city"
  match "/other_events" => "other_events#index"
  match "/other_events/kv" => "other_events#kv"
  match "/other_events/Proposal" => "other_events#Proposal"
  match "/other_events/review" => "other_events#review"
  match "/other_events/new_year_over" => "other_events#new_year_over"
  match "/other_events/christmas_over" => "other_events#christmas_over"
  match "/other_events/page_2" => "other_events#index2"

  #客服信息
  match "/info_list" => "function#infolist"
  match "/info" => "function#info"

  match "/emall" => "function#emall" #emall接口链接
  match "/emagazine" => "function#emagazine" #电子杂志订阅
  match "/results" => "function#results" #导航栏搜索结果页面
  match "/rules" => "function#rules" #会员机制页面
  match "/rules2" => "function#rules2" #话费积分活动细则
  match "/state" => "function#state" #网站声明
  match "/about" => "function#about" #关于我们
  match "/sitemap" => "function#sitemap" #网站地图
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
  match '/yda/yda_list' => 'yda#yda_list'

  #yda2013
  match '/yda/2013' => 'yda2013#index'
  match '/yda/2013/event_purpose' => 'yda2013#event_purpose'
  match '/yda/2013/info' => 'yda2013#info'
  match '/yda/2013/agenda' => 'yda2013#agenda'
  match '/yda/2013/prize' => 'yda2013#prize'
  match '/yda/2013/rater' => 'yda2013#rater'

  resources :weekly_tips, only: :index
  #个人主页
  resources :users do
    match "update_suc" => "users#update_suc"
    match '/designs/autocomplete_recommend_color' => 'designs#autocomplete_recommend_color'
    match '/designs/autocomplete' => 'designs#autocomplete'

    #社区绑定
    match "community" => "users#community"
    match "/community/binding_cancel" => "users#binding_cancel"

    #用户对内和对外的相关页面
    resources :sign_up do
      collection do
        get :reset
      end
    end
    resources :events
    resources :asks
    resources :collects
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
        get :edit_design
        get :design_image_tags
        match :design_update
        get :download
      end
      collection do
        post :update_design_active
        post :update_design
        get :upload_success
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

    match '/purchase/detail' => 'purchase#detail'
    post '/purchase/search_user' => 'purchase#search_user'
    post '/purchase/add_product' => 'purchase#add_product'
    resources :purchase

    match '/points/exchange' => 'points#exchange'
    post '/points/add_gift' => 'points#add_gift'
    resources :points
  end

  resources :design_images do
    collection do
      get :decoration_parts
      get :image_search_index
      post :image_tag
      get :lists
      get :get_thumb
    end
    member do
      get :image_show
      get :more_comment
      get :fullscreen
      get :download
      get :get_latest_and_likes
      post :view_count
    end
  end
  resources :collect do
  end

  resources :huaxun_homes do
    collection do
      post :new_ask
      post :new_rep
      get :get_reply
    end
  end

  resources :cubit_fixtures, only: :create
  resources :visit_ips,only: :create

  #刷新实录
  resources :refresh_record do
    collection do
      get :re_list
      get :re_wlk
    end
  end

  #修改个人签名
  post "/users/:id/update_user_signature" => "users#update_user_signature"

  #API
  mount ::Icolor::API => "/"

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
    resources :skins
    resources :skin_kv_uploads
    match "/baicheng/daily_report"=>'baicheng#daily_report'
    match "/baicheng/story_screen"=>'baicheng#story_screen'
    resources :baicheng do
      get :story_del
      get :story_restoration
    end
    resources :hard_sells, :only => [:index]
    match '/color_codes/autocomplete_recommend_color' => 'color_codes#autocomplete_recommend_color'
    match '/stat' => 'stat#index', :as => 'stat'
    match '/report_export' => 'report_export#index'
    resources :my_show_settings
    resources :event_attendee do
      get :delete_inspiration
    end
    resources :image_libraries do
      collection do
        get :no_audited_all
      end
      get :autocomplete
      get :categories
      put :update_tags
      put :update_title
      get :audited
      get :no_audited
      get :up_down_page
      delete :destroy_image
    end
    resources :suit_images do
      put :update_title
      get :categories
      put :update_tags_suits
      get :audited
    end
  end

  # this route use for kaminari pagination
  MagicContent::Engine.routes.draw do
    match "/baicheng/daily_report"=>'baicheng#daily_report'
    resources :image_libraries
    resources :suit_images
  end

  #扩充magic_admin
  scope "/admin", :module =>"magic_admin" do
    root :to => "main#dashboard" ,as: "admin_root"
    match '/users' => 'users#index'
    resources :seller_users
    match "/autocomplete_area" => 'seller_users#autocomplete_area'
    get "/seller_add_user", :to => 'seller_users#seller_add_user'
    post  "/create_seller_user_id", :to => 'seller_users#create_seller_user_id'
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

  #国庆节活动页面
  get "national_day" => "function#national_day"

  #refresh活动页面
  resource :refresh, only: [:index] do
    get "home" => "refresh#home"
    get "subject" => "refresh#subject"
    get "process" => "refresh#process"
    get "calendar" => "refresh#calendar"
    get "reward" => "refresh#reward"
    get "judge" => "refresh#judge"
  end

  scope "/love", :module =>"baicheng" do

    get "1.html" => "welcome#index"
    get "2.1.html" => "stories#new"
    get "2.2.html" => "stories#image_new"

    get "3.1.html" => "stories#index"
    get ":id.3.2.html" => "stories#show"
    get "4.1.html" => "design_competes#index"
    get ":id.4.2.html" => "design_competes#show"

    match '5.1.html' => 'fashion_model#show', :defaults => { :id => 'foreign'}

    match '5.2.html' => 'fashion_model#show', :defaults => { :id => 'native'}

    match '6.1.html' => 'actives#index'


    root  to: 'welcome#index', as: 'baicheng_root'
    resources :design_works do
      collection do
        get :opus
      end
    end
    resources :stories do
      collection do
        get :act
        post :storyuser
      end
      member do
        get :download
        get :image_new
      end
      collection do
        post :update_image
        post :update_title
      end
    end
    resources :design_competes do
      member do
        get :download
        post :comment
        delete :destroy_comment
      end
    end
    resources :fashion_model
    resources :sysinfo
    resource :upload_contract ,controller: :upload_contract
    resources :story_images
    resources :actives
    match ':page', to: 'welcome#show', via: :get
    resources :contracts do
      collection do
        get :get_user_story
        post :upload_image
      end
    end
    resources :contract_images

    resources :intros, only: :show
  end

  scope '/refresh_life', :module => 'refresh_life' do
    resources :refresh_show
    resources :refresh_list
  end

  scope '/manage', :module => 'manage' do
    get '/clear_cache', to: 'home#clear_cache'
    resources :owner_enter
    resources :seo_sites do
      collection do
        post :update_tag
      end
    end
    resources :tag_sorts do
      collection do
        post :update_tag_sort
      end
    end
    resources :channel_tips do
      collection do
        post :update_tip
        get :find_owner
      end
    end
    resources :questions do
      collection do
        post :create_or_update
      end
    end
    resources :home_banners do
    end
    resources :home_liter_heads do
      collection do
        get :insert_news
      end
    end
    resources :fit_images
    resource :home_heads do
      get 'show_type', on: :collection
      get 'insert_news', on: :collection
      post 'save_insert', on: :collection
    end
    resources :fit_literals do
      collection do
        get :insert_news
      end
    end

    scope '/home_image_lists', :module => 'home_image_lists' do
      resource :home_colors do
        get 'show_type', on: :collection
        get 'insert_news', on: :collection
        post 'update_category', on: :collection
        post 'save_insert', on: :collection
      end
      resource :home_types do
        get 'show_type', on: :collection
        get 'insert_news', on: :collection
        post 'update_category', on: :collection
        post 'save_insert', on: :collection
      end
      resource :home_spaces do
        get 'show_type', on: :collection
        get 'insert_news', on: :collection
        post 'update_category', on: :collection
        post 'save_insert', on: :collection
      end
      resource :home_costs do
        get 'show_type', on: :collection
        get 'insert_news', on: :collection
        post 'update_category', on: :collection
        post 'save_insert', on: :collection
      end
      resource :home_styles do
        get 'show_type', on: :collection
        get 'insert_news', on: :collection
        post 'update_category', on: :collection
        post 'save_insert', on: :collection
      end
    end

    resources :home_image_lists do
      get 'search_type', on: :collection
    end

    resources :special_kv do
      collection do
        post :create_image
        post :save_data
      end
    end

    resources :home_kvs do
      member do
        post :kv_update
        get :delete_file
      end
      collection do
        post :kv_insert
      end
    end
    resources :kv_maps

    resources :home_recommends do
      collection do
        get :edit_recommend
        post :update_recommend
        post :delete_last
        post :insert_recommend
      end
    end

    # 首页装修图库后台
    resources :home_image_lib do
      collection do
        get :tags
        post :create_tag_list
        match :edit_tag_list
        post :photos
        post :upload_image
        post :search_vote
      end
    end

    # 首页设计鉴賞后台
    delete "home_design_show/destroy", to: 'home_design_show#destroy'
    resources :home_design_show do
      collection do
        get :tags
        post :create_image
        post :edit
        post :save_data
      end
    end

    # banner管理
    delete "banner_group/destroy", to: 'banner_group#destroy'
    resources :banner_group do
      collection do
        post :save_data
        post :update_data
      end
    end

    resources :banner_home do
      collection do
        post :create_image
        post :save_data
      end
    end

    resources :banner_channel do
      collection do
        post :create_image
        post :save_data
      end
    end

    resources :banner_refresh do
      collection do
        post :create_image
        post :save_data
      end
    end

    resources :banner_images do
      collection do
        post :create_image
        post :save_data
      end
    end

    resources :banner_company do
      collection do
        post :create_image
        post :save_data
      end
    end

    resources :banner_activities do
      collection do
        post :create_image
        post :save_data
      end
    end
    resources :home_life_videos do
      collection do
        post :create_image
        post :save_data
      end
    end

    resources :universal_column do
      collection do
        post :save_data
      end
    end

    delete "life_memoirs/destroy", to: 'life_memoirs#destroy'
    resources :life_memoirs

    delete "life_infos/destroy", to: 'life_infos#destroy'
    resources :life_infos

    root to: 'home_kvs#index', as: 'manage_root'
  end

  match "/huaxun" => "huaxun/homes#login"
  scope '/huaxun', :module => 'huaxun' do
    resources :homes do
      collection do
        post :new_phone
      end
    end
    resources :hx_profiles
    resources :hx_news do
      collection do
        post :update_more_url
        get :insert_first
        post :insert_save
        post :update_news
      end
    end
    resources :hx_kvs do
      member do
        post :kv_update
      end
      collection do
        get :kv_insert
      end
    end
    resources :hx_maps
    resources :teams do
      collection do
        post :create_image
        post :search
        post :del_all
      end
    end
    resources :consults do
      collection do
        post :create_reply
        post :search_reply
      end
    end
  end

end
