module Simpler
  class Router
    class Route

      attr_reader :controller, :action

      def initialize(method, path, controller, action)
        @method = method
        @path = path
        @controller = controller
        @action = action
      end

      def match?(method, path)
        @method == method && path.match(to_regexp)
      end

      def params(path)
        match_data = path.match(to_regexp)
        match_data.names.each_with_object({}) do |name, params|
          params[name.to_sym] = match_data[name]
        end
      end

      private

      def to_regexp
        Regexp.new("^#{@path.gsub(/:\w+/, '(?<\0>[^/?#]+)')}$")
      end
    end
  end
end
