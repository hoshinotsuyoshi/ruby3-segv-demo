# encoding: UTF-8
require_relative '../core/lib/blog/core/version.rb'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'blog_backend'
  s.version     = Blog.version
  s.author      = 'gem author'
  s.summary     = 'backend'
  s.description = s.summary
  s.homepage    = 'https://blog.example.com'
  s.license     = 'BSD-3-Clause'

  s.required_ruby_version = '>= 2.5.0'

  s.files        = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'blog_api', s.version
  s.add_dependency 'blog_core', s.version
end
