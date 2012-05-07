# -*- encoding: utf-8 -*-
require File.expand_path('../lib/spinebox/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Fankhauser"]
  gem.email         = ["tommylefunk@googlemail.com"]
  gem.description   = %q{A ready to use spine.js rack skeleton builder with precompile support}
  gem.summary       = %q{Generates a rack servable app skeleton with spine.js and sprockets that also allows to precompile for static asset serving.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "spinebox"
  gem.require_paths = ["lib"]
  gem.version       = Spinebox::VERSION
end
