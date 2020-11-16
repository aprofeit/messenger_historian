module Parser
  extend self

  def parse(message)
    case message
    when /ping/i
      'pong'
    when /dad joke/i
      DadJoke.get
    when /attack/i
      Attack.get
    when /motivate/i
      Motivate.get
    end
  end
end
