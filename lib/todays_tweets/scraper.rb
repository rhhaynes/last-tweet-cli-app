class TodaysTweets::Scraper

  def self.scrape(url, what_to_scrape)
    page = Nokogiri::HTML(open(url))
    what_to_scrape.collect do |k,v|
      { k => page.css(v[0]).send(v[1]) }
    end
  end

end
