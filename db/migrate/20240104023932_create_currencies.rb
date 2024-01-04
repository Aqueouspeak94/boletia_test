# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies do |t|
      t.string :code
      t.decimal :value
      t.references :currency_update, null: false, foreign_key: true

      t.timestamps
    end
  end
end
