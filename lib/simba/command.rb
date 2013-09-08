require "thor"

module Simba
  class Command < Thor
    include Thor::Actions
    map "-v" => :version

    def self.source_root
      File.dirname(__FILE__)
    end

    desc "version", "show version"
    def version
      puts Simba::VERSION
    end

    desc "new", "create the skeleton of project"
    def new(name)
      directory('templates', name)
    end
  end
end
