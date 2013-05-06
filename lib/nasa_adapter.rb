require 'nokogiri'
require 'open-uri'

module NASA
  class ISS
    attr_accessor :astronauts

    def initialize
      @doc = Nokogiri::HTML(open('http://www.nasa.gov/mission_pages/station/main/index.html'))
    end

    def current_astronauts
     @astronauts  || (@astronauts = extract_astronauts_info)
    end

    private

    def extract_astronauts_info
      links  = @doc.css('#stationCurrentLabel0 a')
      links.pop #remove last link - 'Read More'
      links.map { |link| hash_from_attributes link}
    end


    def hash_from_attributes(link)
      null , picture, name  =  link.attributes['onmouseover'].value.split(',')
      {
        page:  link.attributes['href'].value.slice(27..-1).chomp("')"), #href to the personal page
        picture: picture.delete("'").insert(0,'http://www.nasa.gov'),
        name: name.delete("'").chop
      }
    end
  end

end