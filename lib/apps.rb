#To get description about app from app page
require 'open-uri'
require 'nokogiri'

class Apps
  def getDesc(url)
  	descript = []
  	doc = Nokogiri::HTML(open(url))
    doc.css('div[@class="d_b_cnt"]').each do | descp | 
  	  descript << descp.content 
  	  sleep(1.0/5.0)
    end 
    return descript
  end

  def getPics(url)
  	doc = Nokogiri::HTML(open(url))
    links = doc.css('a[@data-lightbox="1mobile"]')
    sleep(1.0/5.0)
    hrefs = links.map {|link| link.attribute('href').to_s}
    hrefs.each do |hlink|
    	break if(!hlink.end_with?(".jpeg")&&!hlink.end_with?(".png")&&!hlink.end_with?(".jpg"))
    end
    return hrefs
  end
end
