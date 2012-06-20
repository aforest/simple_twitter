module SimpleTwitter
  class Search
    TWITTER_SEARCH= "http://search.twitter.com/search.json"
    attr_accesor (:per_page)
    def initialize
      @per_page=10
    end
    def search(search_term)
      params={
        :q=>search_term,
        :rpp=>@per_page,}
      response=HTTParty.get(TWITTER_SEARCH,:query =>params,)
      JSON.parse(response.body)
    end
  end
end
