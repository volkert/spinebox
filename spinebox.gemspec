# -*- encoding: utf-8 -*-
require File.expand_path('../lib/spinebox/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Fankhauser"]
  gem.email         = ["tommylefunk@googlemail.com"]
  gem.description   = %q{A ready to use spine.js rack skeleton builder with development server, routes, config and precompile support}
  gem.summary       = %q{Generates a rack servable app skeleton with spine.js and sprockets that also allows to precompile for static asset serving}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "spinebox"
  gem.require_paths = ["lib"]
  gem.version       = Spinebox::VERSION
  
  # define dependencies see http://docs.rubygems.org/read/chapter/20#dependencies
  gem.add_dependency('sprockets', '>= 2.1.2')
  gem.add_dependency('rack', '>= 1.4.1')
  gem.add_dependency('coffee-script', '>= 1.2.0')
  gem.add_dependency('eco', '>= 1.0.0')
  gem.add_dependency('sass', '>= 3.1.15')
  gem.add_dependency('colorize', '>= 0.5.8')
  gem.add_dependency('activesupport', '>= 3.2.2')
end
