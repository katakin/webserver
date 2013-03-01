class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all

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

    date = Time.now

    #parser
    doc = Nokogiri::HTML(openhtml(date))

    @info = []

    #events table
    doc.css('td.event').each do |data|

      arr = []

      title = data.at_css('a.eventlink')

      #id of event
      id = title['href'][/\d+/].to_i

      event = Event.where(id: id).first

      if !event
        event = Event.new

        #name of event
        name = title.text

        #url to image
        img = 'http://afisha.ykt.ru' + data.at_css('a.tips img')['src']

        eventpage = Nokogiri::HTML(open('http://afisha.ykt.ru/event/' + id.to_s))
        desc = eventpage.at_css('div.description').text
      end

      #sessions
      seanses = []
      data.css('div.seans div.seans').each do |seans|
        #id of company in ykt db
        companyid = seans.at_css('a')['href'][/\d+/].to_i

        #yktsession body
        time = seans.text.scan(/\d{2}:\d{2} \(.+?\)/)

        seanses << [companyid, time]
      end

      arr << id
      arr << name
      arr << img
      arr << desc
      arr << seanses

      @info << arr
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@info) }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
end
