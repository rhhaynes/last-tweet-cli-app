class TodaysTweets::Scraper

  def self.scrape(url, how_to_scrape)
    page = Nokogiri::HTML(open(url))
    how_to_scrape.collect do |attribute|
      # code
    end
  end

end
