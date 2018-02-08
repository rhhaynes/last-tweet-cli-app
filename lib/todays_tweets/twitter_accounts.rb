class TodaysTweets::TwitterAccounts
  attr_accessor :name, :handle
  @@all = []

  def self.most_popular(n=5)
    # returns an array containing the most popular twitter accounts based on
    # number of followers
    url = "http://friendorfollow.com/twitter/most-followers/"
    how_to_scrape = {
      name:   "",
      handle: ""
    }
    n.times.collect { TodaysTweets::Scraper.scrape(url, how_to_scrape) }
  end

  def save
    @@all << self unless @@all.include? self
  end

end
