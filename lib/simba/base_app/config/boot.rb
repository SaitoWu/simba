require "rubygems"
require "bundler"
#require "bundle gems"
ENV["RACK_ENV"] ||= "development"
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
# init database
DB = Sequel.sqlite("./db/#{ENV["RACK_ENV"]}.db")
# init sinatra
set :sessions, true
set :root, File.expand_path(".")
set :views, settings.root + "/app/views"
# sinatra reloader
if development?
  require "sinatra/reloader"
  also_reload "lib/**/*.rb", "app/{models,helpers}/**/*.rb"
end
# assetpack support
assets do
  serve "/js", :from => "app/assets/js"
  serve "/css", :from => "app/assets/css"
  serve "/img", :from => "app/assets/img"

  css_compression :sass
  js_compression  :uglify

  js :application, ["/js/*.js"]
  css :application, ["/css/*.css"]
end
# require sinatra files
Dir.glob "./{lib,app/models,app/helpers,app/controllers}/**/*.rb" do |f|
  require f
end
