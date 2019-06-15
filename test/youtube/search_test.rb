require 'test_helper'

class YouTube::SearchTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::YouTube::Search::VERSION
  end

  def test_it_does_something_useful
    refute_nil ENV["YOUTUBE_API_KEY"], "we need YOUTUBE_API_KEY env variable"

    search = YouTube::Search.new("penguin")
    search.first_page!

    result = search.get_search_items.first
    assert_match /penguin|pingu/i, result.title
    assert_includes result.description.downcase, 'penguin'
    assert_includes result.default_thumbnail, result.video_id if result.kind == "youtube#video"
  end

  def test_it_returns_error_sometimes
    ENV.stub :[], nil do
      search = YouTube::Search.new('penguin')
      search.first_page!

      assert_raises YouTube::HTTPError do
        search.get_search_items
      end
    end
  end
end
