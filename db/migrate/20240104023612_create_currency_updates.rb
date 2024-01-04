# frozen_string_literal: true

class CreateCurrencyUpdates < ActiveRecord::Migration[7.1]
  def change
    create_table :currency_updates do |t|
      t.datetime :currency_update

      t.timestamps
    end
  end
end
