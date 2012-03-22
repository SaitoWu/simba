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
      "simba [app_name]"
    end

    desc "Description:\n\n\tsimba is a generator for sinatra applications."

    argument :name, :desc => "The name of your sinatra app"
    class_option :skip_bundle,
                 :default => false,
                 :type => :boolean,
                 :desc => "Skip bundle install when creating app skeleton"

    def setup_skeleton
      self.destination_root = name
      directory("simba/base_app/", self.destination_root)
    end

    def bundle_dependencies
      unless options[:skip_bundle]
        say "Bundling application dependencies using bundler."
        in_root do
          run 'bundle install'
        end
      end
    end
  end
end
