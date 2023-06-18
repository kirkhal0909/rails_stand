# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

use Sentry::Rack::CaptureExceptions

Rails.application.load_server
