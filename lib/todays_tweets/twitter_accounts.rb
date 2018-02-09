class TodaysTweets::TwitterAccount
  attr_accessor :handle, :url, :name, :bio, :tweet
  @@all = []

  def self.all
    @@all
  end

  def self.create_from_handle(twitter_handle)
    unless all.any?{|account| account.handle == twitter_handle}
      account        = new
      account.handle = twitter_handle
      account.url    = "https://twitter.com/" + twitter_handle[1..-1]

      name_qry       = ["div.ProfileHeaderCard h1.ProfileHeaderCard-name a.ProfileHeaderCard-nameLink", "text"]
      bio_qry        = ["div.ProfileHeaderCard p.ProfileHeaderCard-bio", "text"]
      tweet_qry      = ["div.tweet div.content div.js-tweet-text-container p.tweet-text", "text"]
      what_to_scrape = {name: name_qry, bio: bio_qry, tweet: tweet_qry}
      twitter_hash   = TodaysTweets::Scraper.scrape(account.url, what_to_scrape)

      account.name   = twitter_hash[:name]
      account.bio    = twitter_hash[:bio]
      account.tweet  = twitter_hash[:tweet] # create new tweet object
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
      twitter_hash   = TodaysTweets::Scraper.scrape(url, what_to_scrape)
      create_from_handle(twitter_hash[:handle])
    end
  end

end
