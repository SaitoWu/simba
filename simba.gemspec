# -*- encoding: utf-8 -*-
require File.expand_path("../lib/simba/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Saito"]
  gem.email         = ["saitowu@gmail.com"]
  gem.description   = %q{simba is a generator for sinatra applications.}
  gem.summary       = %q{simba aim to set up ruby off rails best practice.}
  gem.homepage      = "https://github.com/SaitoWu/simba"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "simba"
  gem.require_paths = ["lib"]
  gem.version       = Simba::VERSION

  gem.add_dependency("thor", "~> 0.18")
end
