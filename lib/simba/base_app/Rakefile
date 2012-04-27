# load rake tasks
Dir["./lib/tasks/**/*.rake"].sort.each { |ext| load ext }

# load assetpacket tasks
APP_FILE  = './config/boot.rb'
APP_CLASS = 'Sinatra::Application'
require 'sinatra/assetpack/rake'
