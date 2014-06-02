module ScraperHelper
   require 'open-uri'
  require 'nokogiri'

  def scrape(url, tag)
    doc = Nokogiri::HTML(open(url))
    return doc.css(tag).text
  end

  def scrape2
    return "testing123"
  end

end
