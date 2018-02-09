class LastTweet::Scraper

  def self.scrape(url, what_to_scrape)
    page = Nokogiri::HTML(open(url))

    begin
      attributes = what_to_scrape.collect do |k,v|
        case v[2]
        when 'hash_key' then [ k, page.css(v[0]).first[ v[1] ]    ]
        when 'method'   then [ k, page.css(v[0]).first.send(v[1]) ]
        else                 [ k, page.css(v[0]).first.send(v[1]) ]
        end
      end
    rescue
      attributes = what_to_scrape.collect{|k,v| [ k, nil ]}
    end

    attributes.to_h
  end

end
