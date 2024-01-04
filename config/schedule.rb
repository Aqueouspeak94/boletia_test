require File.expand_path("#{File.dirname(__FILE__)}/environment")

# Require the necessary models or services
require './app/services/currency_service'

time = (ENV['frequency_http_request'] || 10).to_i

every time.minutes do
  runner 'CurrencyService.new.latest_currencies'
end
