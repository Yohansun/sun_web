Icolor::Application.routes.draw do

  devise_for :users,  :controllers => {:registrations => "users/register", :sessions => "users/sessions"}
  devise_scope :user do
    match "/users/register/roles" => "users/register#roles"
    match "/users/suc_regist" => "users/register#suc_regist"
    match "/users/username_check" => "users/register#username_check"
  end

  devise_for :admins, :controllers => { :sessions => 'magic_admin/sessions' }
  mount MagicContent::Engine => '/admin/content', :as => 'magic_content'
  mount MagicAdmin::Engine => '/admin', :as => 'magic_admin'

end
