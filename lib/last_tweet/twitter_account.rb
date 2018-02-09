class LastTweet::TwitterAccount
  attr_accessor :handle, :url, :name, :bio, :tweets
  @@all = []

  def self.all
    @@all
  end

  def self.create_from_handle(t_handle)
    unless all.any?{|acct| acct.handle == t_handle}
      account        = new
      account.handle = t_handle
      account.url    = "https://twitter.com/" + t_handle[1..-1]

      name_qry       = ["div.ProfileHeaderCard h1.ProfileHeaderCard-name a.ProfileHeaderCard-nameLink", "text", "method"]
      bio_qry        = ["div.ProfileHeaderCard p.ProfileHeaderCard-bio", "text", "method"]
      what_to_scrape = {name: name_qry, bio: bio_qry}
      twitter_hash   = LastTweet::Scraper.scrape(account.url, what_to_scrape)

      account.name   = twitter_hash[:name]
      account.bio    = twitter_hash[:bio]
      account.tweets = []

      @@all << account
    end
    all.detect{|acct| acct.handle == t_handle}
  end

  def self.most_popular(n=5)
    url = "http://friendorfollow.com/twitter/most-followers/"
    n.times.collect do |i|
      handle_qry     = ["div\#list-container ul.view-list li.row-#{i+1} div.text-holder a", "text", "method"]
      what_to_scrape = {handle: handle_qry}
      twitter_hash   = LastTweet::Scraper.scrape(url, what_to_scrape)
      create_from_handle(twitter_hash[:handle])
    end
  end

end
