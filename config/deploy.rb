# -*- encoding : utf-8 -*-
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.2'        # Or whatever env you want it to run in.
set :rvm_type, :system

require 'bundler/capistrano'

set :application, "icolor"

set :use_sudo, false
set :scm, :git
set :deploy_via, :remote_cache

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :keep_releases, 3

set :git_shallow_clone, 1
set :git_enable_submodules, 1

server "203.156.231.37", :web, :app, :db, primary: true

set :user, "root"
set :repository, "git@github.com:nioteam/icolor.git"
set :branch, "master"
set :deploy_to, "/home/www/rails/icolor"

set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb) 
# tasks
namespace :deploy do

  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} #{assets_dependencies.join ' '} | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end	

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

after 'deploy:update_code', 'deploy:symlink_shared'