# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dmtx/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vincent Hellot"]
  gem.email         = ["hellvinz@gmail.com"]
  gem.description   = %q{ffi wrapper around libdmtx to generate Data Matrix 2D barcodes}
  gem.summary       = %q{ffi wrapper around libdmtx to generate Data Matrix 2D barcodes (similar to qrcode)}
  gem.homepage      = "https://github.com/hellvinz/dmtx"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dmtx"
  gem.require_paths = ["lib"]
  gem.version       = Dmtx::VERSION
  gem.requirements  << "libdmtx, v0.7.2 or greater"
  gem.add_dependency "chunky_png"
  gem.add_dependency "ffi"
end
