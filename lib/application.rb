#To get application name  from the category url
require 'open-uri'
require 'nokogiri'

class Application

  #
  def getApp(url)
  	app_name = []
  	doc = Nokogiri::HTML(open(url))
    doc.css('strong[@class="i_l_title"]').each do | appn | 
  	  app_name << appn.content 
      sleep(1.0/5.0)
    end 
    return app_name
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
