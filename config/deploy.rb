
set :application, "demestoa"


set :repository,  "https://github.com/mxm/prix.git"
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache

set :user, "deploy"
set :use_sudo, false
set :normalize_asset_timestamps, false

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "demestoa.spline.de"                          # Your HTTP server, Apache/etc
role :app, "demestoa.spline.de"                          # This may be the same as your `Web` server
#role :db,  "127.0.0.1", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

#
set :deploy_to, "/home/deploy/#{application}"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
require 'capistrano-unicorn'
after 'deploy:restart', 'unicorn:restart' # app IS NOT preloaded
after 'deploy:restart', 'unicorn:reload'  # app preloaded

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
