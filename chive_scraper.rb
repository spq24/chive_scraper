require 'open-uri'
require 'nokogiri'
require 'mechanize'

url = "http://thechive.com/"
page = Nokogiri::HTML(open(url))

post_url = page.css('article.category-dar a')[0]['href']

dar_page = Nokogiri::HTML(open(post_url))

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

end