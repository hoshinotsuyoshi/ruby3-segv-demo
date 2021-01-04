module Blog
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Blog
      engine_name 'blog'
    end
  end
end

require 'blog/core/routes'
