# frozen_string_literal: true

require 'json'
# currency service
class CurrencyService
  include HTTParty
  base_uri 'https://api.currencyapi.com/v3/latest?'
  default_timeout ENV['timeout_currency_api'].to_f

  def latest_currencies
    start_time = Time.now
    @response = self.class.get('/latest', query: { apikey: ENV['currency_api_key'] })
    parse_currencies
    success = true
  rescue Net::OpenTimeout, Net::ReadTimeout => e
    success = false
  ensure
    create_http_request_history(start_time, success)
  end

  private

  def create_http_request_history(start_time, success)
    finish_time = Time.now
    total_time = Time.at(finish_time - start_time).utc.strftime('%H:%M:%S')
    HttpRequestHistory.create!({ start_time: start_time, total_time: total_time, success: success })
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
