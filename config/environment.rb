#
# ENV['SINATRA_ENV'] ||= "development"
#
# require 'bundler/setup'
# Bundler.require(:default, ENV['SINATRA_ENV'])
#
# configure :development, :production do
#    db = URI.parse(ENV['postgres://xzdwajwhfcskel:f7e5e8fb537a255ca75a790e04fe43575f072c2271fd6ca7d2fad72745796182@ec2-184-72-235-159.compute-1.amazonaws.com:5432/db3gevq2q6cg5e'] || 'postgres://localhost/mydb_dev')
#
#    ActiveRecord::Base.establish_connection(
#      :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#      :host     => db.host,
#      :username => db.user,
#      :password => db.password,
#      :database => db.path[1..-1],
#      :encoding => 'utf8'
#      )
# end
#
# require_all 'app'

ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
Dotenv.load if ENV['SINATRA_ENV'] == "development"

set :database_file, "./database.yml"

require './app/controllers/application_controller'
require_all 'app'
