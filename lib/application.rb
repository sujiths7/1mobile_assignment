#To get application name  from the category url
require 'open-uri'
require 'nokogiri'

class Application

  def getApp(url)
  	cat = []
  	doc = Nokogiri::HTML(open(url))
    doc.css('strong[@class="i_l_title"]').each do | category | 
  	  cat << category.content 
      sleep(1.0/5.0)
    end 
    return cat
  end

  def get_l_links(base_url, url)
    doc = Nokogiri::HTML(open(url))
    links = doc.css('a[@class="i_l_link"]')
    sleep(1.0/5.0)
    hrefs = links.map {|link| base_url + link.attribute('href').to_s}
    return hrefs
  end

  def get_d_links(base_url, url)
    doc = Nokogiri::HTML(open(url))
    dlinks = doc.css('a[@class="i_l_download"]')
    sleep(1.0/5.0)
    dhrefs = dlinks.map {|link| base_url + link.attribute('href').to_s}
    return dhrefs
  end
end

=begin
puts "App Names"
puts Application.new.getApp("http://www.1mobile.com/apps/books_reference/")

puts "App Links"
puts Application.new.get_l_links("http://www.1mobile.com","http://www.1mobile.com/apps/books_reference/")
puts "App DLinks"
puts Application.new.get_d_links("http://www.1mobile.com","http://www.1mobile.com/apps/books_reference/")
=end
