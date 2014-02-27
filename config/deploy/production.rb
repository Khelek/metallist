set :rails_env, 'production'
set :branch, 'master'

set :keep_releases, 15

set :user, 'metallist'

server '62.76.191.87', :app, :web, :db, :primary => true
