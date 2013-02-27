class Forecast
  include Mongoid::Document
  field :date, type: Date
  field :temp_day, type: Integer
  field :temp_night, type: Integer
  field :descr_day, type: String
  field :descr_night, type: String

  index({ date: 1 }, { unique: true, background: true })

  validates :date, uniqueness: true, presence: true
  validates :temp_day, presence: true
  validates :temp_night, presence: true
  validates :descr_day, presence: true
  validates :descr_night, presence: true

  def update_from
  	require 'open-uri'
    require 'nokogiri'

    # open url with exceptions
    failed = true                                                    

    begin                                                            
      html = open("http://www.gismeteo.ru/city/weekly/12917/")

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

    # @info = []

    #Todays forecast
    today = doc.at_css('div.wbfull table')

    # arr = []

    #date
    if !today.css('th.workday').empty?
      date = DateTime.parse(today.css('th.workday').text[/\d+\.\d+/] + '.' + Time.now.year.to_s).to_date
    else
      date = DateTime.parse(today.css('th.weekend').text[/\d+\.\d+/] + '.' + Time.now.year.to_s).to_date
    end
    date += 1.years if date < Time.now.to_date #for next year forcast
    # arr << date.to_s
    prognoz = ForecastToday.where(date: date).first
    prognoz = ForecastToday.new if !prognoz
    prognoz.date = date

    #temperature
    temp = today.css('td.temp span.c').collect(&:text)
    temp_night = temp[0][/\d+/].to_i
    temp_night = -temp_night if temp[0].gsub(/\d/, "") != "+"
    temp_morning = temp[1][/\d+/].to_i
    temp_morning = -temp_morning if temp[1].gsub(/\d/, "") != "+"
    temp_day = temp[2][/\d+/].to_i
    temp_day = -temp_day if temp[2].gsub(/\d/, "") != "+"
    temp_evening = temp[3][/\d+/].to_i
    temp_evening = -temp_evening if temp[3].gsub(/\d/, "") != "+"
    # arr << temp_night
    # arr << temp_morning
    # arr << temp_day
    # arr << temp_evening
    prognoz.temp_night = temp_night
    prognoz.temp_morning = temp_morning
    prognoz.temp_day = temp_day
    prognoz.temp_evening = temp_evening

    #desciption
    descr = today.css('td.cltext').collect(&:text)
    # arr << descr[0]
    # arr << descr[1]
    # arr << descr[2]
    # arr << descr[3]
    prognoz.descr_night = descr[0]
    prognoz.descr_morning = descr[1]
    prognoz.descr_day = descr[2]
    prognoz.descr_evening = descr[3]

    prognoz.save
    # if prognoz.save
    # 	p "#{date.to_s} saved" 
    # else
    # 	p "#{date.to_s} failed to save" 
    # end
    # @info << arr


    #weather table
    doc.css('div.wbshort table').each do |data|

      # arr = []

      # prognoz = Forecast.new
      #date
      if !data.css('td.workday').empty?
        date = DateTime.parse(data.css('td.workday').text[/\d+\.\d+/] + '.' + Time.now.year.to_s).to_date
      else
        date = DateTime.parse(data.css('td.weekend').text[/\d+\.\d+/] + '.' + Time.now.year.to_s).to_date
      end
      date += 1.years if date < Time.now.to_date #for next year forcast
      next if date == Time.now.to_date #skip today
      # arr << date.to_s
      prognoz = Forecast.where(date: date).first
      prognoz = Forecast.new if !prognoz
      prognoz.date = date

      #temperature
      temp = data.css('td.temp span.c').collect(&:text)
      temp_night = temp[0][/\d+/].to_i
      temp_night = -temp_night if temp[0].gsub(/\d/, "") != "+"
      temp_day = temp[1][/\d+/].to_i
      temp_day = -temp_day if temp[1].gsub(/\d/, "") != "+"
      # arr << temp_night
      # arr << temp_day
      prognoz.temp_night = temp_night
      prognoz.temp_day = temp_day

      #desciption
      descr = data.css('td.cltext').collect(&:text)
      # arr << descr[0]
      # arr << descr[1]
      prognoz.descr_night = descr[0]
      prognoz.descr_day = descr[1]

      prognoz.save

      # if prognoz.save
	    # 	p "#{date.to_s} saved" 
	    # else
	    # 	p "#{date.to_s} failed to save" 
	    # end
      # @info << arr
    end
  end
end
