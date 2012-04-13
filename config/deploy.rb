# -*- encoding : utf-8 -*-
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.2'        # Or whatever env you want it to run in.

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

role :web, "58.215.177.238" # Your HTTP server, Apache/etc
role :app, "58.215.177.238" # This may be the same as your `Web` server
role :db, "58.215.177.238", :primary => true # This is where Rails migrations will run

set :user, "root"
set :repository, "git@github.com:nioteam/icolor.git"
set :branch, "master"
set :deploy_to, "/var/rails/icolor"

# tasks
namespace :deploy do
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

after 'deploy:update_code', 'deploy:symlink_shared'

require 'capistrano-unicorn'