# -*- encoding: utf-8 -*-
require_relative '../core/lib/blog/core/version.rb'

Gem::Specification.new do |s|
  s.name          = "blog_api"
  s.version       = Blog.version
  s.authors       = ["gem author"]
  s.summary       = %q{Blog's API}
  s.description   = %q{Blog's API}
  s.homepage      = 'https://blog.example.com'
  s.license       = 'BSD-3-Clause'

  s.required_ruby_version = '>= 2.5.0'

  s.files         = `git ls-files`.split($\).reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'blog_core', s.version
end
