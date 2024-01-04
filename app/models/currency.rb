# frozen_string_literal: true

# modelo de currency
class Currency < ApplicationRecord
  validates :code, length: { minimum: 3 }
  belongs_to :currency_update
end
