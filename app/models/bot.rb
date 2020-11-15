module Bot
  NAME = '@Ava Bot'

  extend self

  def read(message)
    if message.mentions.values.any? { |val| val.include?(NAME) }
      process(message)
    end
  end

  def process(message)
    message = message.body.split("#{NAME} ").last.strip

    case message
    when /ping/
      respond('pong')
    end
  end

  def respond(body)
    options = {
      body: {
        message: {
          body: body
        }
      }.to_json,
      headers: {
        'Content-Type': 'application/json'
      }
    }

    HTTParty.post(messenger_url, options) unless Rails.env.test?
  end

  private

  def messenger_url
    Rails.env.production? ? 'https://messenger-listener.profeit.com/messages' : 'http://localhost:3001/messages'
  end
end
