require 'pathname'
require_relative 'simpler/application'
require_relative 'simpler/middleware/logger_middleware'
require_relative 'simpler/middleware/not_found_middleware'

module Simpler

  class << self
    def application
      Application.instance
    end

    def root
      Pathname.new(File.expand_path('..', __dir__))
    end
  end

end
