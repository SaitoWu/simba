require "bundler"
require "yaml"

# require "bundle gems"
ENV["RACK_ENV"] ||= "development"
Bundler.require(:default, ENV["RACK_ENV"].to_sym)

# init sinatra
set :root, File.expand_path(".")
set :sessions, true
set :session_secret, "f15f322b42a647f88139a0dec227d80f"
set :views, settings.root + "/app/views"
set :database_file, settings.root + "/config/database.yml"

if production?
  set :manifest, YAML::load(File.read(settings.root + "/public/manifest.yml"))
end

# sinatra reloader
if development?
  require "sinatra/reloader"
  also_reload "lib/**/*.rb", "app/{models,helpers}/**/*.rb"
end

# require project files
Dir.glob "./{lib,app/{models,helpers,routes}}/**/*.rb" do |f|
  require f
end
