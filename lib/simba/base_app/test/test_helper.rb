ENV['RACK_ENV'] ||= "test"
require_relative "../config/boot.rb"
# factory_girl
dir = File.expand_path File.dirname(__FILE__)
Dir.glob "#{dir}/factory/**/*_factory.rb" do |f|
  require f
end
# minitest
require "minitest/autorun"
# rack test
require "rack/test"
# database_clean
DatabaseCleaner.strategy = :truncation

class TestCase < MiniTest::Unit::TestCase
  def initialize *xs
    super
    DatabaseCleaner.clean
  end
end

class FunctionalTestCase < TestCase
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
end