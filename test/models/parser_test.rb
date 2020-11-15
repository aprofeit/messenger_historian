require 'test_helper'

class ParserTest < ActiveSupport::TestCase
  test 'ping' do
    assert_equal 'pong', Parser.parse('Ping')
  end
end
