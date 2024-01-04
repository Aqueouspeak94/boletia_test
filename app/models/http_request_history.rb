# frozen_string_literal: true

class HttpRequestHistory < ApplicationRecord
  validates :start_time, presence: true
  validates :total_time, presence: true
  validates :success, presence: true
end
