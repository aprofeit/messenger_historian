class Message < ApplicationRecord
  serialize :attachments, JSON
  serialize :mentions, JSON

  before_validation :set_default_attachments
  before_validation :set_default_mentions

  def type=(val)
    self.kind = val
  end

  private
  
  def set_default_attachments
    self.attachments ||= []
  end

  def set_default_mentions
    self.mentions ||= {}
  end
end
