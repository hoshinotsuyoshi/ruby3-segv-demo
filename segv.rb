require 'objspace'

reloader = Rails.application.reloader

50.times { |n|
  reloader.new.run!
  puts "#{n+1} times reloaded"
  puts "#{ObjectSpace.memsize_of_all * 0.001 * 0.001} MB"
}
