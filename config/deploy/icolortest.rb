# -*- encoding : utf-8 -*-
require 'new_relic/recipes'
require 'hipchat/capistrano'
set :rvm_ruby_string, '1.9.3-p448'
set :rvm_type, :system

server "210.13.98.31", :web, :app, :db, primary: true
set :user, "root"

set :repository, "git@git.networking.io:nioteam/icolor.git"
set :branch, "yoshikizh001"
set :scm, :git
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :deploy_via, :remote_cache
set :deploy_to, "/bigdata/rails/icolor"
set :keep_releases, 5
set :hipchat_token, "4cbf6fde19410295cad3d202a87ade"
set :hipchat_room_name, "Release House"
set :hipchat_announce, false
# set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)

namespace :deploy do

  # COMMET BELOW WHEN FRESH CAP
  # namespace :assets do
  #   task :precompile, :roles => :web, :except => { :no_release => true } do
  #     from = source.next_revision(current_revision)
  #     if capture("cd #{latest_release} && #{source.local.log(from)} #{assets_dependencies.join ' '} | wc -l").to_i > 0
  #       run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
  #     else
  #       logger.info "Skipping asset pre-compilation because there were no asset changes"
  #     end
  #   end
  # end

  desc "Restart web server"
  task :restart, roles: :app, except: {no_release: true} do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/system #{release_path}/public/system"
  end
end

before 'bundle:install', 'deploy:symlink_shared'
after 'bundle:install', 'deploy:migrate'
#after "deploy:symlink_shared","refresh_sitemaps","update_crontab"

after "deploy:update", "newrelic:notice_deployment"