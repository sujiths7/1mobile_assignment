#get category names from the main url

require 'nokogiri' 
require 'open-uri'
require 'rubygems'

class Category
  def getCat(url)
  	doc = Nokogiri::HTML(open(url)) 
  	cat = []
  	doc.xpath('//dd/a').each do | category | 
  	  cat << category.content 
      sleep(1.0/5.0)
    end 
    return cat 
  end

  def get_c_link (url)
    doc = Nokogiri::HTML(open(url))
    links = doc.css('//dd/a')
    sleep(1.0/5.0)
    hrefs = links.map {|link| url + link.attribute('href').to_s}
    return hrefs
  end
end


=begin
puts "Categories"
puts Category.new.getCat("http://www.1mobile.com")
puts "Categories Links"
puts Category.new.get_c_link("http://www.1mobile.com")
=end
