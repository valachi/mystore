require 'bundler/capistrano'

server '5.9.59.102', :web, :app, :db, primary: true

set :deploy_via, :remote_cache
set :scm, :git
set :repository, 'git://github.com/valachi/mystore.git'
set :deploy_to, '~'
set :user, 'mystore'
set :use_sudo, :false
set :normalize_asset_timestamps, false

ssh_options[:forward_agent] = true

namespace :deploy do
  task(:start) {}
  task(:stop) {}

  desc 'restarting the application'
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch# {current_path}/tmp/restart.txt"
  end
end
