# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dmtx/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vincent Hellot"]
  gem.email         = ["hellvinz@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dmtx"
  gem.require_paths = ["lib"]
  gem.version       = Dmtx::VERSION
  gem.add_dependency "chunky_png"
  gem.add_dependency "ffi"
end
