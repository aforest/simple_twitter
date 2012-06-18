module SimpleTwitter
  class Search
    TWITTER_SEARCH= "http://search.twitter.com/search.json"
    attr_accesor (:per_page)
    def initialize
      @per_page=10
    end
    def search(query)
      params={
        :q=>query,
        :rpp=>@per_page,}
      response=HTTParty.get(TWITTER_SEARCH,:query =>params,)
    end
  end
end

