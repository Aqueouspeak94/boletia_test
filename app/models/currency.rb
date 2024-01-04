# frozen_string_literal: true

# modelo de currency
class Currency < ApplicationRecord
  validates :code, length: { minimum: 2 }
  validates :value, presence: true
  belongs_to :currency_update
end
