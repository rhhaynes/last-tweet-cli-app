class TodaysTweets::Tweets
  attr_accessor :name, :handle, :bio, :tweet, :timestamp
  BASE_PATH = "https://twitter.com/"

  def self.create_from_handle(twitter_handle)
    url = BASE_PATH + twitter_handle[1..-1]
    how_to_scrape = {
      name:      "",
      handle:    "",
      bio:       "",
      tweet:     "",
      timestamp: ""
    }
    TodaysTweets.Scraper.scrape(url, how_to_scrape)
  end

end
