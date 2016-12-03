require "youtube/search/version"
require "httparty"

module YouTube
  class Search
    def initialize(search_word)
      @search_word = search_word
    end

    def response(page_token='')
       HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{@search_word}&pageToken=#{page_token}&key=#{ENV['API_KEY']}")
    end

    def next_page_token
      @result["nextPageToken"] if @result
    end

    def previous_page_token
      @result["prevPageToken"]
    end

    def first_page
      @result = JSON.parse response.body
      Page.new(@result)
    end

    def next_page
      @result = JSON.parse response(next_page_token).body
    end

    def previous_page
      @result = JSON.parse response(previous_page_token).body
    end

    def items
      @result['items']
    end
  end
end

class YouTube::Page
  def initialize(result)
    @result = result
  end
  def items
    @result['items']
  end
end
