Icolor::Application.config.to_prepare {
  Devise::SessionsController.layout "magic_admin/devise"
}