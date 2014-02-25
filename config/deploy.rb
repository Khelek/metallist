set :stages, %w(production vagrant)
set :default_stage, "vagrant"

require 'capistrano/ext/multistage'
require 'capi/unicorn'
require "rvm/capistrano"
require 'bundler/capistrano'

set :application, 'metallist'
set :rvm_type, :system

set :use_sudo, false

set :rake, "#{rake} --trace"
set :app_dir, "/srv/#{application}"
set :current_path, "#{app_dir}/current"
set :deploy_to, "#{app_dir}"

set :ssh_options, { forward_agent: true }
default_run_options[:pty] = true

set :repository, "https://github.com/khelek/metallist.git"  # Your clone URL
set :scm, "git"
set :deploy_via, :remote_cache

namespace :deploy do
	
	namespace :assets do
		desc "Local precompile assets and upload to server"
  	task :precompile, roles: :app do
  	  run_locally "RAILS_ENV=#{rails_env} #{rake} assets:clean && RAILS_ENV=#{rails_env} #{rake} assets:precompile"
  	  run_locally "cd public && tar -jcf assets.tar.bz2 assets"
  	  top.upload "public/assets.tar.bz2", "#{shared_path}", via: :scp
  	  run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
  	  run_locally "rm public/assets.tar.bz2"
  	  run_locally "#{rake} assets:clean"
  	end

		desc "Symlink local precompile assets"
    task :symlink, roles: :app do
      run "rm -rf #{latest_release}/public/assets &&
            mkdir -p #{latest_release}/public &&
            mkdir -p #{shared_path}/assets &&
            ln -s #{shared_path}/assets #{latest_release}/public/assets"
    end
	end

  desc "Symlinks the database.yml"
  task :symlink_db, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Symlinks the backup.rb"
  task :symlink_backup, roles: :app do
    run "ln -nfs #{shared_path}/config/backup.rb #{release_path}/config/backup.rb"
  end

  desc "Seed database data"
  task :seed_data do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
  end
end

namespace :log do
  desc "Watch tailf env log"
  task :tailf do
    stream("tailf /u/apps/#{application}/current/log/#{rails_env}.log")
  end
end

before 'deploy:finalize_update', 'deploy:symlink_db'
before 'deploy:finalize_update', 'deploy:assets:symlink'
after 'deploy:update_code', 'deploy:assets:precompile'
after 'deploy:symlink_db', 'deploy:symlink_backup'
after "deploy:update", "deploy:cleanup"
after "deploy:restart", "unicorn:stop"

#require 'capistrano_colors'
