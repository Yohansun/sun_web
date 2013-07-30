# -*- encoding : utf-8 -*-
require 'hipchat/capistrano'
set :rvm_ruby_string, '1.9.2'
set :rvm_type, :system

server "42.121.19.234", :web, :app, :db, primary: true
set :user, "root"

set :repository, "git@git.networking.io:nioteam/icolor.git"
set :branch, "task_1015"
set :scm, :git
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :deploy_via, :remote_cache
set :keep_releases, 3
set :deploy_to, "/home/www/rails/icolor"

set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)
set :hipchat_token, "4cbf6fde19410295cad3d202a87ade"
set :hipchat_room_name, "Release House"
set :hipchat_announce, false
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

  task :start, :roles => :app do
    unicorn.start
  end

  task :stop, :roles => :app do
    unicorn.stop
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    unicorn.reload
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/system #{release_path}/public/system"
  end
end

before 'bundle:install', 'deploy:symlink_shared'

require 'capistrano-unicorn'
