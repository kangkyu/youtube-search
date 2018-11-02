require "youtube/search/search_item"

module YouTube
  class SearchItems
    def initialize(search_list_response)
      @result = search_list_response
    end

    def items
      @result['items'].map do |item|
        YouTube::SearchItem.new(item)
      end
    end
  end
end
