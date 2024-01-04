# frozen_string_literal: true

# Currencies controller
class CurrenciesController < ApplicationController
  before_action :asign_params, only: [:index]

  def index
    data = @currency == 'all' ? Currency.all : Currency.where(code: @currency)
    data = data.joins(:currency_update)
               .where(currency_updates: { currency_update: @finit..@fend })
    if data.empty?
      render json: { message: 'No records found' }, status: :forbidden
    else
      render json: data
    end
  end

  private

  def asign_params
    @finit = params[:finit].present? ? Date.parse(params[:finit]) : CurrencyUpdate.first&.currency_update
    @fend = params[:fend].present? ? Date.parse(params[:fend]) : CurrencyUpdate.last&.currency_update
    @currency = params[:currency]
  end
end
