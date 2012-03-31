set :application, "Sixofhearts"
set :repository,  "ppp.sixofhearts.us:/srv/git/paul-blog.git"

set :scm, :git
set :scm_verbose, true

set :use_sudo, true

set :deploy_to, "/srv/web/sixofhearts-blog"
set :shared_path, "/srv/web/sixofhearts-blog"


server "ppp.sixofhearts.us", :web, :app, :db, :primary => true

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
