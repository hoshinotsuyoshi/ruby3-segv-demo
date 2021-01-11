# frozen_string_literal: true

module ActionDispatch
  module Journey # :nodoc:
    # The Routing table. Contains all routes for a system. Routes can be
    # added to the table by calling Routes#add_route.
    class Routes # :nodoc:
      include Enumerable

      attr_reader :routes, :custom_routes, :anchored_routes

      def initialize
        @routes             = []
        @ast                = nil
        @anchored_routes    = []
        @custom_routes      = []
        @simulator          = nil
      end

      def empty?
        routes.empty?
      end

      def length
        routes.length
      end
      alias :size :length

      def last
        routes.last
      end

      def each(&block)
        routes.each(&block)
      end

      def clear
        routes.clear
        anchored_routes.clear
        custom_routes.clear
      end

      def partition_route(route)
        #if route.path.anchored && route.ast.grep(Nodes::Symbol).all?(&:default_regexp?)
        #  p 1
          anchored_routes << route
        #else
        #  raise
        #  custom_routes << route
        #end
      end

      def ast
        @ast ||= begin
          asts = anchored_routes.map(&:ast)
          Nodes::Or.new(asts)
        end
      end

      def simulator
        @simulator ||= begin
          gtg = GTG::Builder.new(ast).transition_table
          GTG::Simulator.new(gtg)
        end
      end

      def add_route(name, mapping)
        route =
          Journey::Route.new(name: name,
                             app: mapping.application,
                             path: mapping.path,
                             constraints: mapping.conditions,
                             required_defaults: mapping.required_defaults,
                             defaults: mapping.defaults,
                             request_method_match: mapping.send(:request_method),
                             precedence: routes.length,
                             scope_options: mapping.scope_options,
                             internal: mapping.instance_variable_get(:@internal))

        routes << route
        partition_route(route)
        clear_cache!
        route
      end

      private
        def clear_cache!
          @ast                = nil
          @simulator          = nil
        end
    end
  end
end
