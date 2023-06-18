Raven.configure do |config|
  config.dsn = ENV.fetch('SENTRY_DSN', 'http://localhost:9000/1')
end
