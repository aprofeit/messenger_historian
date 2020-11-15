class MessagesController < ApplicationController
  def create
    message = Message.create!(message_params)
    Bot.read(message)

    head(:created)
  end

  private

  def message_params
    params.require(:message).permit(:type, :senderID, :body, :threadID, :messageID, :timestamp, :isGroup, attachments: [], mentions: {})
  end
end
