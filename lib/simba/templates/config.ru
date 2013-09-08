require "./config/boot.rb"
Process.fork do
  exec "bundle exec linner watch"
end if settings.development?
run Sinatra::Application
