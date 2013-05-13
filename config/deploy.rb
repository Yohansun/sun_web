#encoding: utf-8

# -*- encoding : utf-8 -*-
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
require "capistrano/ext/multistage"       #多stage部署所需
require 'bundler/capistrano'       #添加之后部署时会调用bundle install
require 'tinder'


set :stages, %w(production icolortest)
set :default_stage, "production"
set :application, "icolor"

set :use_sudo, false
set :scm, :git
set :git_shallow_clone, 1
set :git_enable_submodules, 1
#set :deploy_via, :remote_cache
set :deploy_env, 'production'

set :keep_releases, 15

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :deployer, `whoami`.chomp

# before "deploy:update", "notify:campfire_start"
# after "deploy:restart", "notify:campfire_end"

desc "生成sitemap"
task :refresh_sitemaps do
  run "cd #{release_path} && RAILS_ENV=#{deploy_env} bundle exec rake sitemap:refresh"
end

desc "生成定时任务"
task :update_crontab, :roles => :db do
  run "cd #{release_path} && bundle exec whenever --set environment=#{deploy_env} --update-crontab #{application}"
end

task :clear_rails_cache do
  run "cd #{release_path} && bundle exec rake cache:clear RAILS_ENV=#{deploy_env}"
end
