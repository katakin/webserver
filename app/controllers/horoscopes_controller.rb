class HoroscopesController < ApplicationController
  # GET /horoscopes
  # GET /horoscopes.json
  def index
    require 'open-uri'
    require 'nokogiri'
    info = []

    vodoley = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/vodoley"))
    info << vodoley.at_css('div.personal-horoscopes-tabs.yui3-u.tabs div').text.strip

    #ryby = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/ryby"))
    #oven = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/oven"))
    #telets = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/telets"))
    #bliznetsy = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/bliznetsy"))
    #rak = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/rak"))
    #lev = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/lev"))
    #deva = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/deva"))
    #vesy = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/vesy"))
    #skorpion = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/skorpion"))
    #strelets = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/strelets"))
    #kozerog = Nokogiri::HTML(open("http://www.astrostar.ru/goroskopy/na-segodnya/kozerog"))
    
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
