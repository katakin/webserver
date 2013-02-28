class HoroscopesController < ApplicationController
  # GET /horoscopes
  # GET /horoscopes.json
  def index
    require 'open-uri'
    require 'nokogiri'
    info = []

    vodoley = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/aquarius/"))
    info << vodoley.at_css('div.horo-body').text.strip
    ryby = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/pisces/"))
    info << ryby.at_css('div.horo-body').text.strip
    oven = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/aries/"))
    info << oven.at_css('div.horo-body').text.strip
    telets = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/taurus/"))
    info << telets.at_css('div.horo-body').text.strip
    bliznetsy = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/gemini/"))
    info << bliznetsy.at_css('div.horo-body').text.strip
    rak = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/cancer/"))
    info << rak.at_css('div.horo-body').text.strip
    lev = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/leo/"))
    info << lev.at_css('div.horo-body').text.strip
    deva = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/virgo/"))
    info << deva.at_css('div.horo-body').text.strip
    vesy = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/libra/"))
    info << vesy.at_css('div.horo-body').text.strip
    skorpion = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/scorpio/"))
    info << skorpion.at_css('div.horo-body').text.strip
    strelets = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/sagittarius/"))
    info << strelets.at_css('div.horo-body').text.strip
    kozerog = Nokogiri::HTML(open("http://m.horoscopes.rambler.ru/capricorn/"))
    info << kozerog.at_css('div.horo-body').text.strip
    
    respond_to do |format|
      #format.html # index.html.erb
      format.json { render json: Oj.dump(info) }
    end  
  end

  # GET /horoscopes/1
  # GET /horoscopes/1.json
  def show
    @horoscope = Horoscope.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @horoscope }
    end
  end

  # GET /horoscopes/new
  # GET /horoscopes/new.json
  def new
    @horoscope = Horoscope.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @horoscope }
    end
  end

  # GET /horoscopes/1/edit
  def edit
    @horoscope = Horoscope.find(params[:id])
  end

  # POST /horoscopes
  # POST /horoscopes.json
  def create
    @horoscope = Horoscope.new(params[:horoscope])

    respond_to do |format|
      if @horoscope.save
        format.html { redirect_to @horoscope, notice: 'Horoscope was successfully created.' }
        format.json { render json: @horoscope, status: :created, location: @horoscope }
      else
        format.html { render action: "new" }
        format.json { render json: @horoscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /horoscopes/1
  # PUT /horoscopes/1.json
  def update
    @horoscope = Horoscope.find(params[:id])

    respond_to do |format|
      if @horoscope.update_attributes(params[:horoscope])
        format.html { redirect_to @horoscope, notice: 'Horoscope was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @horoscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horoscopes/1
  # DELETE /horoscopes/1.json
  def destroy
    @horoscope = Horoscope.find(params[:id])
    @horoscope.destroy

    respond_to do |format|
      format.html { redirect_to horoscopes_url }
      format.json { head :no_content }
    end
  end
end
