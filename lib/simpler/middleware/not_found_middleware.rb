module Simpler
  module Middleware
    class NotFoundMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)
        if status == 404
          body = ['Not Found']
        end
        [status, headers, body]
      end
    end
  end
end
