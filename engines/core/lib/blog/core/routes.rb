module Blog
  module Core
    class Engine < ::Rails::Engine
      def self.add_routes(&block)
        @blog_routes ||= []
        @blog_routes << block unless @blog_routes.include?(block)
      end

      def self.draw_routes(&block)
        @blog_routes ||= []
        eval_block(block) if block_given?
        @blog_routes.each { |r| eval_block(&r) }
        @blog_routes = []
      end

      def eval_block(&block)
        Blog::Core::Engine.routes.send :eval_block, block
      end
    end
  end
end
