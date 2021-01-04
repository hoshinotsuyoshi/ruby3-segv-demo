require 'blog/core'

module Blog
  module Auth
    def self.config
      yield(Blog::Auth::Config)
    end
  end
end

require 'blog/auth/engine'
