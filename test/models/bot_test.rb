require 'test_helper'

class BotTest < ActiveSupport::TestCase
  test 'reading a messsage' do
    message = messages(:ping)

    Bot.read(message)
  end
end
