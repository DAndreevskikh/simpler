require 'logger'

module Simpler
  module Middleware
    class LoggerMiddleware
    def initialize(app)
      @app = app
      @logger = Logger.new(Simpler.root.join('log/app.log'))
    end

    def call(env)
      request = Rack::Request.new(env)
      status, headers, response = @app.call(env)
      log_request(request)
      log_response(response, status, headers)
      [status, headers, response]
    end

    private

    def log_request(request)
      @logger.info("Request: #{request.request_method} #{request.fullpath}")
      @logger.info("Handler: #{request.env['simpler.controller']}##{request.env['simpler.action']}")
      @logger.info("Parameters: #{request.params}")
    end

    def log_response(response, status, headers)
      @logger.info("Response: #{status} #{headers['Content-Type']}")
      body_content = response.is_a?(Array) ? response.join : response
      @logger.info("Template: #{body_content}")
    end
  end
 end
end
