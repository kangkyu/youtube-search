require 'test_helper'

class YouTube::SearchTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::YouTube::Search::VERSION
  end

  def test_it_does_something_useful
    refute_nil ENV["API_KEY"], "we need API_KEY env variable"
    result = YouTube::Search.new("penguin").response
    assert_match /penguin/i, result["items"].first["snippet"]["title"]
  end
end
