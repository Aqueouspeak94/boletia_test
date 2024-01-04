# frozen_string_literal: true

# currency update model
class CurrencyUpdate < ApplicationRecord
  has_many :currencies
  validates :currency_update, presence: true
  accepts_nested_attributes_for :currencies
end
