module YouTube
  class SearchItem
    def initialize(search_result)
      @result = search_result
    end

    def title
      snippet['title']
    end

    def video_id
      id['videoId']
    end

    def description
      snippet['description']
    end

    def channel_id
      snippet['channelId']
    end

    def channel_title
      snippet['channelTitle']
    end

    def kind
      id["kind"]
    end

  private

    def snippet
      @result["snippet"]
    end

    def id
      @result["id"]
    end
  end
end
