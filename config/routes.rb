Icolor::Application.routes.draw do

  devise_for :admins, :controllers => { :sessions => 'magic_admin/sessions' }
  mount MagicContent::Engine => '/admin/content', :as => 'magic_content'
  mount MagicAdmin::Engine => '/admin', :as => 'magic_admin'

end
