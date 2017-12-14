require 'open-uri'
require 'pry'
require 'nokogiri'


class Scraper




  def self.scrape_index_page(index_url)
# for each student, parse the name (class 'student-name', location (class 'student-location') profile_url (a href)
html = open("./fixtures/student-site/index.html")
doc = Nokogiri::HTML(html)

student_name = doc.css(".student-card")
scraped_students = []
 student_name.each do |index|
 scraped_students <<{
  :name => index.css(".student-name").text,
  :location => index.css(".student-location").text,
  :profile_url => index.css("a").attribute("href").value


}

end
scraped_students
end


  def self.scrape_profile_page(profile_url)
binding.pry
    html = open("./fixtures/student-site/index.html")
    profile_page = Nokogiri::HTML(open(profile_url))

scraped_student = {}
icons = profile_page.css(".social-icon-container").children.css("a").map { |a| a.attribute("href").value}

  end







end #of class scraper
