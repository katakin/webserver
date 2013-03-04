class Horoscope
	include Mongoid::Document
	field :capricorn, type: String
	field :aquarius, type: String
	field :pisces, type: String
	field :aries, type: String
	field :taurus, type: String
	field :gemini, type: String
	field :cancer, type: String
	field :leo, type: String
	field :virgo, type: String
	field :libra, type: String
	field :scorpio, type: String
	field :sagittarius, type: String
	field :den, type: Time

	index({ den: 1 }, { unique: true, background: true })

	validates :capricorn, presence: true
	validates :aquarius, presence: true
	validates :pisces, presence: true
	validates :aries, presence: true
	validates :taurus, presence: true
	validates :gemini, presence: true
	validates :cancer, presence: true
	validates :leo, presence: true
	validates :virgo, presence: true
	validates :libra, presence: true
	validates :scorpio, presence: true
	validates :sagittarius, presence: true

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

    def parse(znak)
    	return znak.at_css('div.horo-body').text.strip
    end

   	def update_from
   		require 'open-uri'
		require 'nokogiri'

   		znaki = ['capricorn','aquarius','pisces','aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius']
   		horo_url = "http://m.horoscopes.rambler.ru/"

		horoscopes = Horoscope.where(den: Time.now.to_date).first
		update = true
		if !horoscopes
			horoscopes = Horoscope.new 
			update = false
		end
		
		if !update
			znaki.each do |sign|
				info = Nokogiri::HTML(openhtml(horo_url + sign))
				horoscopes.send(sign+'=', parse(info))
			end   
			horoscopes.den = Time.now.to_date
		end
		horoscopes.save

		horoscopes1 = Horoscope.where(den: (Time.now.to_date + 1.day)).first
		update1 = true
		if !horoscopes1
			horoscopes1 = Horoscope.new 
			update1 = false
		end
		
		if !update1
			znaki.each do |sign|
				info = Nokogiri::HTML(openhtml(horo_url + 'tomorrow/'+ sign))
				horoscopes1.send(sign+'=', parse(info))
			end   
			horoscopes1.den = Time.now.to_date + 1.day
		end
		horoscopes1.save
	end
end