# https://martinschurig.com/posts/2015/02/pulling-production-database-to-local-machine-rails-task/
# frozen_string_literal: true

# namespace :db do
#   desc 'Pull production db to development'
#   task pull: %i[dump restore remote_assets]

#   dumpfile = 'db.sql'
#   host = 'my2.allofmy.co.uk'
#   env_to_pull_from = 'production'

#   task :dump do
#     remote = Rails.application.config.database_configuration[env_to_pull_from]
#     puts 'mySQL on production database...'
#     system "ssh root@#{host} -t 'mysqldump --login-path=client #{remote['database']} > /tmp/#{dumpfile}'"
#     system "scp root@#{host}:/tmp/#{dumpfile} #{Rails.root}"
#     system "ssh root@#{host} -t 'rm -f /tmp/#{dumpfile}'"
#     puts 'Done!'
#   end

#   namespace :restore do
#     dev = Rails.application.config.database_configuration['development']
#     puts 'mySQL on development database...'

#     restore = "mysql --login-path=client #{dev['database']} < #{dumpfile}"
#     system restore
#     File.delete(dumpfile)

#     puts 'Done!'
#   end

#   desc 'Pull remote assets if Capistrano is available'
#   task :remote_assets do
#     system "cap #{env_to_pull_from} uploads:download" if File.exist?(Rails.root.join('Capfile'))
#   end
# end
