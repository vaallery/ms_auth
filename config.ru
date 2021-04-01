require_relative 'config/environment'

run Rack::URLMap.new(
  '/auth/v1/signup' => UserRoutes,
  '/auth/v1/login' => SessionRoutes
)