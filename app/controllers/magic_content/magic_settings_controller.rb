module MagicContent
  class MagicSettingsController < BaseController
    load_and_authorize_resource
    action :all, :except => [:show]

    def create
      MagicSetting.magic_content_site_name = params[:magic_content_site_name] if params[:magic_content_site_name]
      MagicSetting.magic_content_site_url = params[:magic_content_site_url] if params[:magic_content_site_url]
      MagicContent.extra_settings.each do |setting|
        MagicSetting.send(setting[:key] + "=", params[setting[:key].to_sym]) if params[setting[:key].to_sym]
      end
      expire_page main_app.root_path
      redirect_to :action => "index"
    end

  end
end