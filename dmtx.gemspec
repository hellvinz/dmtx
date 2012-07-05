# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dmtx/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vincent Hellot"]
  gem.email         = ["hellvinz@gmail.com"]
  gem.description   = %q{ffi wrapper around libdmtx to generate qrcodes}
  gem.summary       = %q{ffi wrapper around libdmtx to generate qrcodes}
  gem.homepage      = "https://github.com/hellvinz/dmtx"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dmtx"
  gem.require_paths = ["lib"]
  gem.version       = Dmtx::VERSION
  gem.add_dependency "chunky_png"
  gem.add_dependency "ffi"
end
