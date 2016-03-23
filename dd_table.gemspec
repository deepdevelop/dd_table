# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dd_table/version'

Gem::Specification.new do |spec|
  spec.name          = "dd_table"
  spec.version       = DDTable::VERSION
  spec.authors       = ["greatghoul"]
  spec.email         = ["greatghoul@gmail.com"]

  spec.summary       = %q{Simple table builder for rails.}
  spec.description   = %q{Simple table builder for rails.}
  spec.homepage      = "https://github.com/deepdevelop/dd_table_rails"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency('rspec', '~> 3.0')
  spec.add_development_dependency('factory_girl')
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"

  spec.add_dependency('actionpack')
end
