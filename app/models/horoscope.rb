class Horoscope
	include Mongoid::Document
	field :kozerog, type: String
	field :vodoley, type: String
	field :ryby, type: String
	field :oven, type: String
	field :telets, type: String
	field :bliznetsy, type: String
	field :rak type: String
	field :lev, type: String
	field :deva, type: String
	field :vesy, type: String
	field :scorpion, type: String
	field :strelets, type: String
	field :den, type: Time

	index({ date: 1 }, { unique: true, background: true })

	validates :kozerog, presence: true
	validates :vodoley, presence: true
	validates :ryby, presence: true
	validates :oven, presence: true
	validates :telets, presence: true
	validates :bliznetsy, presence: true
	validates :rak, presence: true
	validates :lev, presence: true
	validates :deva, presence: true
	validates :vesy, presence: true
	validates :scorpion, presence: true
	validates :strelets, presence: true

	require 'open-uri'
	require 'nokogiri'

    def openhtml(url)
    	# open url with exceptions
    	failed = true
    	begin
    		html = open(url)
			failed = false                                                 
			rescue OpenURI::HTTPError => e                                   
				error_message = e.message                                      
				response_message = "Response Code = #{e.io.status[0]}"         
			rescue SocketError => e                                          
				error_message = e.message                                      
				response_message = "Host unreachable"                          
			rescue => e                                                      
				error_message = e.message                                      
				response_message = "Unknown error"
		end                                                              
		if failed
	        html = []
	    end

      	return html
    end

    #parser
    kozerog = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/capricorn/"))
	vodoley = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/aquarius/"))
	ryby = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/pisces/"))
	oven = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/aries/"))
	telets = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/taurus/"))
	bliznetsy = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/gemini/"))
	rak = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/cancer/"))
	lev = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/leo/"))
	deva = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/virgo/"))
	vesy = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/libra/"))
	skorpion = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/scorpio/"))
	strelets = Nokogiri::HTML(openhtml("http://m.horoscopes.rambler.ru/sagittarius/"))

	@horoscopes

    @info = []
    info << kozerog.at_css('div.horo-body').text.strip
    info << vodoley.at_css('div.horo-body').text.strip
    info << ryby.at_css('div.horo-body').text.strip
    info << oven.at_css('div.horo-body').text.strip
    info << telets.at_css('div.horo-body').text.strip
    info << bliznetsy.at_css('div.horo-body').text.strip
    info << rak.at_css('div.horo-body').text.strip
    info << lev.at_css('div.horo-body').text.strip
    info << deva.at_css('div.horo-body').text.strip
    info << vesy.at_css('div.horo-body').text.strip
    info << scorpion.at_css('div.horo-body').text.strip
    info << strelets.at_css('div.horo-body').text.strip

end