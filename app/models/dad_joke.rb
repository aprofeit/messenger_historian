require 'json'

module DadJoke
  extend self

  def get
    options = {
      headers: {
        'User-Agent' => 'Ava Bot (https://github.com/aprofeit/messenger-historian',
        'Accept' => 'application/json'
      }
    }

    response = HTTParty.get('https://icanhazdadjoke.com/', options)
    JSON.parse(response.body)['joke']
  end
end
