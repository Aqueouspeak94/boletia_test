# frozen_string_literal: true

# currency service
class CurrencyService
  include HTTParty
  base_uri 'https://api.currencyapi.com/v3/latest?'

  def latest_rates
    self.class.get('/latest', query: { apikey: ENV['currency_api_key'] })
  end

end
