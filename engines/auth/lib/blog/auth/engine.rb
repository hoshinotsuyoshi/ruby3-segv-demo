module Blog
  module Auth
    class Engine < Rails::Engine
      isolate_namespace Blog
      engine_name 'blog_auth'

      def self.activate
        if Blog::Auth::Engine.backend_available?
          Dir.glob(File.join(File.dirname(__FILE__), "../../controllers/backend/*/*/*_decorator*.rb")) do |c|
            Rails.configuration.cache_classes ? require(c) : load(c)
          end
        end
      end

      def self.api_available?
        @@api_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Blog::Api::Engine')
      end

      def self.backend_available?
        @@backend_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Blog::Backend::Engine')
      end

      def self.api_available?
        @@api_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Blog::Api::Engine')
      end

      if backend_available?
        paths["app/controllers"] << "lib/controllers/backend"
        paths["app/views"] << "lib/views/backend"
      end

      if api_available?
        paths["app/controllers"] << "lib/controllers/api"
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
