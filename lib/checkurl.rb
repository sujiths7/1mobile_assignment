require 'open-uri'

class CheckURL
  def isURL(url)
    begin
      true if open(url)
    rescue
      false
    end
  end	
end
