require 'test_helper'

class YouTube::SearchTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::YouTube::Search::VERSION
  end

  def test_it_does_something_useful
    refute_nil ENV["API_KEY"], "we need API_KEY env variable"

    search = YouTube::Search.new("penguin")
    search.first_page!

    result = search.get_search_items
    assert_match /penguin/i, result.first.title
    # assert_includes result.first.description.downcase, 'penguin'
  end

  def test_it_returns_error_sometimes
    ENV["API_KEY"] = nil
    search = YouTube::Search.new('penguin')
    search.first_page!

    assert_raises YouTube::HTTPError do
      result = search.get_search_items
    end
  end
end
