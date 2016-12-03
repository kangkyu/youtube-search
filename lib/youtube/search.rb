require "youtube/search/version"
require "httparty"

module YouTube
  class Search
    def initialize(search_word)
      @search_word = search_word
    end

    def result
      response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + @search_word + "&key=#{ENV['API_KEY']}")
      @result = JSON.parse response.body
    end

    def next_page_token
      @result["nextPageToken"]
    end

    def next_page
      response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + @search_word + "&key=#{ENV['API_KEY']}" + "&pageToken=#{next_page_token}")
      @result = JSON.parse response.body
    end
  end
end
