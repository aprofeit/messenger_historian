require 'test_helper'

class BotTest < ActiveSupport::TestCase
  setup do
    FakeWeb.register_uri(:post, Rails.configuration.messenger_listener_url, status: 201)
  end

  test 'reading a messsage' do
    message = messages(:ping)

    Bot.read(message)
  end
end
