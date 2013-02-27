class YktNewsController < ApplicationController
  # GET /ykt_news
  # GET /ykt_news.json
  def index
    @ykt_news = YktNew.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@ykt_news, :mode => :compat) }
    end
  end

  # GET /ykt_news/1
  # GET /ykt_news/1.json
  # def show
  #   @ykt_news = YktNew.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @ykt_news }
  #   end
  # end

  # # GET /ykt_news/new
  # # GET /ykt_news/new.json
  # def new
  #   @ykt_news = YktNew.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @ykt_news }
  #   end
  # end

  # # GET /ykt_news/1/edit
  # def edit
  #   @ykt_news = YktNew.find(params[:id])
  # end

  # # POST /ykt_news
  # # POST /ykt_news.json
  # def create
  #   @ykt_news = YktNew.new(params[:ykt_news])

  #   respond_to do |format|
  #     if @ykt_news.save
  #       format.html { redirect_to @ykt_news, notice: 'Ykt new was successfully created.' }
  #       format.json { render json: @ykt_news, status: :created, location: @ykt_news }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @ykt_news.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PUT /ykt_news/1
  # # PUT /ykt_news/1.json
  # def update
  #   @ykt_news = YktNew.find(params[:id])

  #   respond_to do |format|
  #     if @ykt_news.update_attributes(params[:ykt_news])
  #       format.html { redirect_to @ykt_news, notice: 'Ykt new was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @ykt_news.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /ykt_news/1
  # # DELETE /ykt_news/1.json
  # def destroy
  #   @ykt_news = YktNew.find(params[:id])
  #   @ykt_news.destroy

  #   respond_to do |format|
  #     format.html { redirect_to ykt_news_url }
  #     format.json { head :no_content }
  #   end
  # end
end
