require "thor"
require "thor/group"
require_relative "simba/version"

module Simba
  class SkeletonGenerator < Thor::Group
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    def self.banner
      "simba [app_name] [options]"
    end

    desc "Description:\n\s\ssimba is a generator for Sinatra applications."

    argument :name, :desc => "The name of your sinatra app"

    def setup_skeleton
      self.destination_root = name
      directory("simba/base_app/", self.destination_root)
    end

    class_option "skip-bundle",
                 :aliases => "-S", 
                 :desc => "Skip bundle install when creating app skeleton",
                 :banner => ""
    def bundle_dependencies
      unless options.include? "skip-bundle" then
        say "Bundling application dependencies using bundler."
        in_root do
          run 'bundle install'
        end
      end
    end
  end
end
