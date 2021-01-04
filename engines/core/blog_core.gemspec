# encoding: UTF-8

require_relative 'lib/blog/core/version.rb'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'blog_core'
  s.version     = Blog.version
  s.author      = 'gem author'
  s.summary     = 'The bare bones necessary for Blog.'
  s.description = 'The bare bones necessary for Blog.'
  s.homepage    = 'https://blog.example.com'
  s.license     = 'BSD-3-Clause'

  s.required_ruby_version     = '>= 2.5.0'
  s.required_rubygems_version = '>= 1.8.23'

  s.files        = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'

  s.add_dependency 'rails', '>= 6.1.0'
end
