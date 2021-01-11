require 'objspace'

reloader = Rails.application.reloader
# require 'irb'
# binding.irb

# reloader = Rails.application.routes_reloader

50.times { |n|
  reloader.new.run!
  # reloader.reload!
  puts "#{n+1} times reloaded"
  puts "#{ObjectSpace.memsize_of_all * 0.001 * 0.001} MB"
}
