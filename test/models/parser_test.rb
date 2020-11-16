require 'test_helper'

class ParserTest < ActiveSupport::TestCase
  test 'ping' do
    assert_equal 'pong', Parser.parse('Ping')
  end

  test 'dad jokes' do
    FakeWeb.register_uri(:get, Rails.configuration.dad_joke_url, body: { 'joke' => 'Funny joke' }.to_json)

    assert_equal 'Funny joke', Parser.parse('dad joke')
  end
end
