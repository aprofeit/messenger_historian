module Bot
  NAME = '@Ava Bot'

  extend self

  def read(message)
    if message.mentions.values.any? { |val| val.include?(NAME) }
      process(message)
    end
  end

  def process(message)
    body = message.body.split("#{NAME} ").last.strip

    respond({
      body: Parser.parse(body),
      threadID: message.threadID
    })
  end

  def respond(message)
    options = {
      body: {
        message: {
          body: message[:body],
          threadID: message[:threadID]
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
