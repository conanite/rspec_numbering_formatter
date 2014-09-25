# -*- coding: utf-8; mode: ruby  -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rspec_numbering_formatter'

Gem::Specification.new do |gem|
  gem.name          = "rspec_numbering_formatter"
  gem.version       = RspecNumberingFormatter::VERSION
  gem.authors       = ["Conan Dalton"]
  gem.license       = 'MIT'
  gem.email         = ["conan@conandalton.net"]
  gem.description   = %q{ An rspec formatter that shows elapsed time, example count, example description, and example location, with no scrolling except for errors. }
  gem.summary       = %q{ RSpec formatter with more information in less space  }
  gem.homepage      = "https://github.com/conanite/rspec_numbering_formatter"

  gem.add_development_dependency 'rspec', '~> 3.1'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
