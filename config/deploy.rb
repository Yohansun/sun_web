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

role :web, "203.156.231.37" # Your HTTP server, Apache/etc
role :app, "203.156.231.37" # This may be the same as your `Web` server
role :db, "203.156.231.37", :primary => true # This is where Rails migrations will run

set :user, "root"
set :repository, "git@github.com:nioteam/icolor.git"
set :branch, "production"
set :deploy_to, "/home/www/rails/icolor"

# tasks
namespace :deploy do
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