require "yaml"

namespace :db do

  database_url = YAML.load_file("./config/database.yml")["default"]["url"]

  desc "Perform migration reset (full erase and migration up)"
  task :setup do
    puts `sequel -Etm ./db/migrations -M 0 #{database_url}`
    puts `sequel -Etm ./db/migrations #{database_url}`
    puts "<= sq:migrate:reset executed"
  end

  desc "Perform migration up/down to VERSION"
  task :version do
    version = ENV['VERSION'].to_i
    raise "No VERSION was provided" if version.nil?
    puts `sequel -Etm db/migrations -M #{version} #{database_url}`
    puts "<= sq:migrate:to version=[#{version}] executed"
  end

  desc "Perform migration up to latest migration available"
  task :migrate do
    puts `sequel -Etm ./db/migrations #{database_url}`
    puts "<= sq:migrate:up executed"
  end

  desc "Perform migration down (erase all data)"
  task :rollback do
    puts `sequel -Etm ./db/migrations -M 0 #{database_url}`
    puts "<= sq:migrate:down executed"
  end
end
