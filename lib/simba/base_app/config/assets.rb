module Assets
  App = Sprockets::Environment.new
  App.append_path File.expand_path(File.dirname(__FILE__) + '/../app/assets')

  Sprockets::Helpers.configure do |config|
    config.environment = App
    config.prefix = ''
    config.digest = true

    manifest = File.dirname(__FILE__) + '/../public/manifest.json'
    if ENV['RACK_ENV'] != 'development' and File.exist?(manifest)
      config.manifest = Sprockets::Manifest.new App, manifest
    end
  end

  class Middleware
    def initialize app
      @app = app
    end

    def call env
      if env['PATH_INFO'] =~ /^\/(js|css|img)\//
        App.call env
      else
        @app.call env
      end
    end
  end

  module Helpers
    extend Sprockets::Helpers

    def css file
      file = "css/#{file}.css"
      %Q|<link rel='stylesheet' href='#{Helpers.asset_path file}'/>|
    end

    def js file
      file = "js/#{file}.js"
      %Q|<script src='#{Helpers.asset_path file}'></script>|
    end
  end
end
