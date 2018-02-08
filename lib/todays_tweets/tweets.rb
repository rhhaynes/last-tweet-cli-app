class TodaysTweets::Tweet
  attr_accessor :account, :message, :timestamp
  BASE_PATH = "https://twitter.com/"

  def self.create_from_handle(twitter_handle)
    url = BASE_PATH + twitter_handle[1..-1]
    base_qry       = ""
    account_qry    = [base_qry + ]
    message_qry    = [base_qry + ]
    timestamp_qry  = [base_qry + ]
    what_to_scrape = {
      account:   account_qry,
      message:   message_qry,
      timestamp: timestamp_qry}
    TodaysTweets.Scraper.scrape(url, how_to_scrape)
  end

end
