require 'redis'

REDIS_CONFIG = { url: ENV['REDIS_URL'] }
REDIS = Redis.new(REDIS_CONFIG)
