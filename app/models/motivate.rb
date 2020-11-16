require 'json'

module Motivate
  extend self

  def get
    options = {
      headers: {
        'Accept': 'application/json'
      }
    }

    body = HTTParty.get(Rails.configuration.motivate_url, options).response.body
    quotes = JSON.parse(body).sample
    "#{quotes['text']} - #{quotes['author']}"
  end
end
