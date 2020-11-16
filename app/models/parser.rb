module Parser
  extend self

  def parse(message)
    case message
    when /ping/i
      'pong'
    when /dad joke/i
      DadJoke.get
    end
  end
end
