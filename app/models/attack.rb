require 'json'

module Attack
  extend self

  def get
    response = HTTParty.get(Rails.configuration.insult_url)
    JSON.parse(response.body)['insult']
  end
end
