# frozen_string_literal: true

require 'json'
# currency service
class CurrencyService
  include HTTParty
  base_uri 'https://api.currencyapi.com/v3/latest?'

  def latest_currencies
    @response = self.class.get('/latest', query: { apikey: ENV['currency_api_key'] })
    parse_currencies
  end

  def parse_currencies
    body = JSON.parse(@response.body)
    @date = body['meta']['last_updated_at']
    @currencies_data = body['data']

    find_currency
  end

  def find_currency
    create_currencies unless CurrencyUpdate.find_by_currency_update(@date)
  end

  def create_currencies
    currencies = []
    @currencies_data.each_value do |data|
      currencies << data
    end

    currency_date = CurrencyUpdate.create!(currency_update: @date)
    currency_date.currencies.create!(currencies)
  end
end
