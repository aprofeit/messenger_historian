require 'test_helper'

class ParserTest < ActiveSupport::TestCase
  test 'ping' do
    assert_equal 'pong', Parser.parse('Ping')
  end

  test 'dad jokes' do
    FakeWeb.register_uri(:get, Rails.configuration.dad_joke_url, body: { 'joke' => 'Funny joke' }.to_json)

    assert_equal 'Funny joke', Parser.parse('dad joke')
  end

  test 'attack' do
    FakeWeb.register_uri(Rails.configuration.insult_url, body: { 'insult' => 'fuck you' }.to_json)
    assert_equal 'fuck you', Parser.parse('attack')
  end
end
