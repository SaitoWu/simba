source "https://rubygems.org"

gem "slim"
gem "sass"
gem "sqlite3"
gem "sequel"
gem "sinatra"
gem "coffee-script"
gem "sinatra-contrib"
gem "sinatra-flash"
gem "sinatra-assetpack", :require => "sinatra/assetpack"

group :development, :test do
  gem "pry"
end

group :production do
  gem "thin"
end

group :test do
  gem "rack-test"
  gem "factory_girl"
  gem "database_cleaner"
end

group :deploy do
  gem "uglifier"
  gem "capistrano"
end
