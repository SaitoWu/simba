namespace :assets do
  desc "precompile assets"
  task :precompile do
    exec "bundle exec linner build"
  end
end
