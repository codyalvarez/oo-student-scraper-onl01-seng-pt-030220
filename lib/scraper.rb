require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)

      students_hash = []
      html = Nokogiri::HTML(open(index_url))
      html.css(".student-card").collect do |student|
        hash = {
          name: student.css("h4.student-name").text,
          location: student.css("p.student-location").text,
          profile_url: "http://students.learn.co/" + student.css("a").attribute("href")
        }
        students_hash << hash

      students_hash
    end

  def self.scrape_profile_page(profile_url)

  end

end
