# frozen_string_literal: true

class CreateHttpRequestHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :http_request_histories do |t|
      t.datetime :start_time
      t.float :total_time
      t.boolean :success

      t.timestamps
    end
  end
end
