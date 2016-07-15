require 'pry'
require 'httparty'
require 'nokogiri'
require 'json'

url = 'https://www.behance.net/gallery/38084993/30-movie-characters'
html = HTTParty.get(url)

doc = Nokogiri::HTML(html)
pry

showings = []

doc.css('.image-loaded').each do |showing|

  links = showing.css('.image-loaded src').map { |tag| tag.text.strip }
  showings.push(
    links: links
    )
end

puts JSON.pretty_generate(showings)
