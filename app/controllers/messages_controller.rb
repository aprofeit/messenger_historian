class MessagesController < ApplicationController
  def summary
  end

  def create
    Message.create!(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:type, :senderID, :body, :threadID, :messageID, :timestamp, :isGroup, attachments: [], mentions: {})
  end
end
