class LastTweet::Tweet
  attr_accessor :account, :message, :timestamp
  @@all = []

  def self.all
    @@all
  end

  def self.create_from_handle(t_handle)
    url = "https://twitter.com/" + t_handle[1..-1]
    message_qry    = ["div.tweet div.content div.js-tweet-text-container p.tweet-text", "text", "method"]
    timestamp_qry  = ["div.tweet div.content div.stream-item-header small.time a.tweet-timestamp", "title", "hash_key"]
    what_to_scrape = {message: message_qry, timestamp: timestamp_qry}
    twitter_hash   = LastTweet::Scraper.scrape(url, what_to_scrape)

    unless all.any?{|twt| twt.message == twitter_hash[:message] && twt.timestamp == twitter_hash[:timestamp]}
      tweet = new
      tweet.message   = twitter_hash[:message]
      tweet.timestamp = twitter_hash[:timestamp]
      tweet.add_account(t_handle)
      @@all << tweet
    end

    all.detect{|twt| twt.message == twitter_hash[:message] && twt.timestamp == twitter_hash[:timestamp]}
  end

  def add_account(t_handle)
    t_account = LastTweet::TwitterAccount.all.detect{|acct| acct.handle == t_handle}
    t_account ? self.account = t_account : self.account = LastTweet::TwitterAccount.create_from_handle(t_handle)
    self.account.tweets << self unless self.account.tweets.include? self
  end

  def remove
    self.account.remove
    @@all.delete(self)
  end

end
