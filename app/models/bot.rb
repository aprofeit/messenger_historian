module Bot
  NAME = '@Ava Bot'

  extend self

  def read(message)
    if message.body.starts_with?(NAME)
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

    HTTParty.post(messenger_url, options)
  end

  private

  def messenger_url
    Rails.configuration.messenger_listener_url
  end
end
