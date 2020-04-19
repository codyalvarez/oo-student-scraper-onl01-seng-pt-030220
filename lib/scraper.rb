require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
      html = open('fixtures/student-site/index.html')
      doc = Nokogiri::HTML(html)

      scraped_students = []

      students = doc.css(".student-card")
      students.each do |student|
        name = student.css(".student-name").text
        location = student.css(".student-location").text
        profile_url = student.css("a").attr("href").text
        hash = {:name => name,
        :location => location,
        :profile_url => profile_url
      }
      scraped_students << hash
    end
      scraped_students
    end

  def self.scrape_profile_page(profile_url)

  end

end
