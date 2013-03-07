class Weather
  include Mongoid::Document
  field :temp, type: Integer
  field :descr, type: String
  field :wind, type: Integer
  field :wind_direction, type: String
  field :barp, type: Integer
  field :hum, type: Integer
  field :time, type: DateTime

  validates :temp, presence: true
  validates :descr, presence: true
  validates :wind, presence: true
  validates :wind_direction, presence: true
  validates :barp, presence: true
  validates :hum, presence: true
  validates :time, uniqueness: true, presence: true

  def update_from
  	require 'open-uri'
    require 'nokogiri'

    # open url with exceptions
    failed = true                                                    

    begin                                                            
      html = open("http://www.gismeteo.ru/city/daily/12917/")

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

    #parser
    doc = Nokogiri::HTML(html)

    # doc = Nokogiri::HTML(open("http://www.gismeteo.ru/city/daily/12917"))

    # info = []

    current = doc.at_css('div#weather')

    #tempearture
    temp_string = current.at_css('dd.m_temp.c').text
    temp = temp_string[/\d+/].to_i
    temp = -temp if temp_string.gsub(/\d/, "") != "+"

    #descr
    descr = current.at_css('dl.cloudness tr td').content

    #wind
    wind = current.at_css('dd.m_wind.ms').text.to_i
    wind_direction = current.at_css('dl.wicon dt').content

    #barometer
    barp = current.at_css('dd.m_press.torr').text.to_i

    #humidity
    hum = current.at_css('div.wicon.hum').text.to_i

    #time
    time = current.at_css('span.icon.date')['data-obs-time'].to_datetime
    # time = current.at_css('span.icon.date').text
    
    # info << temp
    # info << descr
    # info << wind
    # info << wind_direction
    # info << barp
    # info << hum
    # info << time

    weather = Weather.where(time: time).first
    weather = Weather.new if !weather

    weather.temp = temp
    weather.descr = descr
    weather.wind = wind
    weather.wind_direction = wind_direction
    weather.barp = barp
    weather.hum = hum
    weather.time = time

    weather.save
  end

  def clean_db
  	Weather.destroy_all(:conditions => {:time.lt => Time.now.to_date - 30.days})
  	Event.destroy_all(:conditions => {:created_at.lt => Time.now.to_date - 45.days})
  	Forecast.destroy_all(:conditions => {:date.lt => Time.now.to_date - 30.days})
  	ForecastToday.destroy_all(:conditions => {:date.lt => Time.now.to_date - 30.days})
  	Horoscope.destroy_all(:conditions => {:den.lt => Time.now.to_date - 30.days})
  end
end
