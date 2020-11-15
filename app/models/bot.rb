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

    respond(Parser.parse(message))
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
    Rails.configuration.messenger_listener_url
  end
end
