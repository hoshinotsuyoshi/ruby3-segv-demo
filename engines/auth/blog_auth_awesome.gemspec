# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'blog_auth_awesome'
  s.version     = '4.2.0'
  s.summary     = 'Provides authentication'
  s.description = s.summary

  s.required_ruby_version = '>= 2.5.0'

  s.author      = 'gem author'
  s.homepage    = 'https://blog.example.com'
  s.license     = 'BSD-3-Clause'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  blog_version = '>= 4.1', '< 5.0'
  s.add_dependency 'blog_core', blog_version
end
