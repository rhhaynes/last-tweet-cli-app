require 'pry'

class TodaysTweets::TwitterAccount
  attr_accessor :handle, :url, :name, :bio, :tweets
  @@all = []

  def self.all
    @@all
  end

  def self.create_from_handle(twitter_handle)
    unless all.any?{|account| account.handle == twitter_handle}
      account        = new
      account.handle = twitter_handle
      account.url    = "https://twitter.com/" + twitter_handle[1..-1]
      account.name   = nil
      account.bio    = nil
      account.tweets = nil # object
      @@all << account
    end
    all.detect{|account| account.handle == twitter_handle}
  end

  def self.most_popular(n=5)
    url = "http://friendorfollow.com/twitter/most-followers/"
    n.times.collect do |i|
      base_qry       = "div\#list-container ul.view-list li.row-#{i+1} div.text-holder "
      handle_qry     = [base_qry + "a", "text"]
      what_to_scrape = {handle: handle_qry}
      twitter_handle = TodaysTweets::Scraper.scrape(url, what_to_scrape)
      create_from_handle(twitter_handle)
    end

    binding.pry
  end

end
