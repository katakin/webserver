# encoding: utf-8
class YktNew
  include Mongoid::Document
  field :time, type: DateTime
  field :title, type: String
  field :url, type: String
  field :image, type: String

  validates :time, presence: true
  validates :title, presence: true
  validates :url, presence: true

  default_scope order_by(:time => :desc).limit(100)

  def update_from
  	require 'open-uri'
    require 'nokogiri'

    # open url with exceptions
    failed = true                                                    

    begin                                                            
      html = open("http://news.ykt.ru/article/category/1")

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

    # @ykt_news = []

    #news
    doc.css('div.items div.hit').each do |data|

      # arr = []
      
			#image
      src = data.at_css('div.image img')['src']
      src = 'http://news.ykt.ru' + src
      # arr << src

      #title & url
      url = data.at_css('div.hit-title a')['href']
      url = 'http://news.ykt.ru' + url
      title = data.at_css('div.hit-title a').text
      # arr << url
      # arr << title

      news = YktNew.where(url: url).first
      update = true
      if !news
        news = YktNew.new 
        update = false
      end

      if !update
        #create time
        timeago = data.css('div.article-title').text
        number = timeago[/^\d+/].to_i
        time_mez = timeago[/мин|ч/]

        if time_mez == 'мин'
          time = number.minutes.ago
        else
          time = number.hours.ago
        end
        # arr << time
        
        news.time = time 
      end

      news.title = title
      news.url = url
      news.image = src

      news.save

      # @ykt_news << arr
    end
  end
end
