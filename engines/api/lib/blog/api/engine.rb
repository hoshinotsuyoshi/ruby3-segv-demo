require 'rails/engine'

module Blog
  module Api
    class Engine < Rails::Engine
      isolate_namespace Blog
      engine_name 'blog_api'
    end
  end
end
