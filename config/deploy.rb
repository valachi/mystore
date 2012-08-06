require 'bundler/capistrano'

set :application, 'mystore'
server '5.9.59.102', :webb, :app, :db, pimary: true

set :scm, :git
set :repository, 'git://github.com/valachi/mystore.git'
set :deploy_to, '~'
set :user, 'mystore'
set :use_sudo, :false

set :deploy_via, :copy
set :copy_strategy, :export

namespace :deploy do
  task :start do; end
  task :stop do; end

  desc 'restarting the application'
  task :restart, roles: :app, except: { no_release: true } do
    run "touch# {current_path}/tmp/restart.txt"
  end
end
