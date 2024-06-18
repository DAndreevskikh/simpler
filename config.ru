require_relative 'config/environment'

use Simpler::Middleware::LoggerMiddleware
use Simpler::Middleware::NotFoundMiddleware

run Simpler.application
