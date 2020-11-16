require 'test_helper'

class MotivateTest < ActiveSupport::TestCase
  test 'get' do
    response = [{
        author: 'Carl Sandburg',
        text: 'Nothing happens unless first we dream.'
    }].to_json

    FakeWeb.register_uri(:get, Rails.configuration.motivate_url, body: response)

    assert_equal 'Nothing happens unless first we dream. - Carl Sandburg', Motivate.get
  end
end
