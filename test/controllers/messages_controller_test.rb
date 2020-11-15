require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test 'valid message requests get persisted' do
    assert_difference 'Message.count' do
      post messages_url, params: valid_message_params
    end
  end

  private

  def valid_message_params
    {
      message: {
        type: 'message',
        senderID: '123456',
        body: 'Hello there!',
        threadID: '78910',
        messageID: '1112131415',
        isGroup: true,
        attachments: [],
        mentions: {}
      }
    }
  end
end
