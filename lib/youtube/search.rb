require "youtube/search/version"
require "httparty"

module YouTube
  class Search
    # Your code goes here...
    def initialize(search_word)
      @search_word = search_word
    end

    def result
      response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + @search_word + "&key=#{ENV['API_KEY']}")
      JSON.parse response.body
    end
  end
end
