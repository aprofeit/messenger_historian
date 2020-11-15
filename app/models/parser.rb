module Parser
  extend self

  def parse(message)
    case message
    when /ping/i
      'pong'
    end
  end
end
