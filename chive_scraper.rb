require 'open-uri'
require 'nokogiri'
require 'mechanize'
require "./chive_delete.rb"


directory = Dir.pwd

delete_files(directory)


url = "http://thechive.com/"
page = Nokogiri::HTML(open(url))

post_url = page.css('article.category-dar a')[0]['href']

puts "found dar"

dar_page = Nokogiri::HTML(open(post_url))

puts "opened dar"

agent = Mechanize.new

image = dar_page.css('section.post-content img').each do |i|
 
 str = i['src']	
 
 if str.include? ".jpg"
 	img = str.slice(0..(str.index('.j')))
 	img = img + 'jpg'
 elsif str.include? ".png"
 	img = str.slice(0..(str.index('.p')))
 	img = img + 'png'
 elsif str.include? ".gif"
 	img = str.slice(0..(str.index('.g')))
 	img = img + 'gif' 	
 end

 agent.get(img).save

 puts "Added image #{i}"

end