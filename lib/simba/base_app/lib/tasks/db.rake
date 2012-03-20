namespace :db do
  require "sequel"
  Sequel.extension :migration
  DB = Sequel.sqlite('db/test.db')

  desc "Perform migration reset (full erase and migration up)"
  task :setup do
    Sequel::Migrator.run(DB, "db/migrations", :target => 0)
    Sequel::Migrator.run(DB, "db/migrations")
    puts "<= sq:migrate:reset executed"
  end

  desc "Perform migration up/down to VERSION"
  task :version do
    version = ENV['VERSION'].to_i
    raise "No VERSION was provided" if version.nil?
    Sequel::Migrator.run(DB, "db/migrations", :target => version)
    puts "<= sq:migrate:to version=[#{version}] executed"
  end

  desc "Perform migration up to latest migration available"
  task :migrate do
    Sequel::Migrator.run(DB, "db/migrations")
    puts "<= sq:migrate:up executed"
  end

  desc "Perform migration down (erase all data)"
  task :rollback do
    Sequel::Migrator.run(DB, "db/migrations", :target => 0)
    puts "<= sq:migrate:down executed"
  end
end
