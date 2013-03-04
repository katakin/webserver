class Event
  include Mongoid::Document
  field :image, type: String
  field :title, type: String
  field :desc, type: String
  field :id, type: Integer

  validates :image, presence: true
  validates :title, presence: true
  validates :desc, presence: true
  validates :id, presence: true

  has_many :ykt_sessions

  def update_from
    require 'open-uri'
    require 'nokogiri'

    def openhtml(date)
      # open url with exceptions
      failed = true
      formatted_date = date.strftime('%d.%m.%Y')

      url = "http://afisha.ykt.ru/category/kino/date/" + formatted_date
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

    # @info = []

    7.times do |i|
      date = Time.now + i.day

      #parser
      doc = Nokogiri::HTML(openhtml(date))

      #events table
      doc.css('td.event').each do |data|

        # arr = []

        title = data.at_css('a.eventlink')

        #id of event
        id = title['href'][/\d+/].to_i

        event = Event.where(id: id).first

        if !event
          event = Event.new

          event.id = id
          #name of event
          # name = title.text
          event.title = title.text

          #url to image
          # img = 'http://afisha.ykt.ru' + data.at_css('a.tips img')['src']
          event.image = 'http://afisha.ykt.ru' + data.at_css('a.tips img')['src']

          eventpage = Nokogiri::HTML(open('http://afisha.ykt.ru/event/' + id.to_s))
          # desc = eventpage.at_css('div.description').text.strip
          event.desc = eventpage.at_css('div.description').text.strip

          event.save
        end

        #sessions
        # seanses = []
        data.css('div.seans div.seans').each do |seans|
          #id of company in ykt db
          companyid = seans.at_css('a')['href'][/\d+/].to_i
          comp = Company.where(yktid: companyid).first
          comp = Company.create(yktid: companyid, name: "New company") if !comp

          sess = event.ykt_sessions.where(date: date, company: comp).first
          sess = event.ykt_sessions.new(date: date, company: comp) if !sess

          #yktsession body
          # time = seans.text.scan(/\d{2}:\d{2} \(.+?\)/)
          sess.body = seans.text.scan(/\d{2}:\d{2} \(.+?\)/)

          sess.save
          # seanses << [companyid, time]
        end

        # arr << id
        # arr << name
        # arr << img
        # arr << desc
        # arr << seanses

        # @info << arr
      end
      # @info << date.to_s
    end
  end
end
