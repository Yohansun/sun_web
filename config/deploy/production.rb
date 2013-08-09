# -*- encoding : utf-8 -*-
require 'new_relic/recipes'
require 'hipchat/capistrano'
set :rvm_ruby_string, '1.9.3-p448'
set :rvm_type, :system

server "134.119.18.11", :web, :app, :db, primary: true
set :user, "root"

set :repository, "git@git.networking.io:nioteam/icolor.git"
set :branch, "master_0701"
set :scm, :git
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :deploy_via, :remote_cache
set :deploy_to, "/bigdata/rails/icolor"
set :keep_releases, 5
set :hipchat_token, "4cbf6fde19410295cad3d202a87ade"
set :hipchat_room_name, "Release House"
set :hipchat_announce, false

namespace :deploy do

  desc "Restart web server"
  task :restart, roles: :app, except: {no_release: true} do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs /nfs/system #{release_path}/public/system"
  end
end

before 'bundle:install', 'deploy:symlink_shared'
after "deploy:update","refresh_sitemaps","update_crontab", "clear_rails_cache"

after "deploy:update", "newrelic:notice_deployment"