class YktSessionsController < ApplicationController
  # GET /ykt_sessions
  # GET /ykt_sessions.json
  def index
    @ykt_sessions = YktSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ykt_sessions }
    end
  end

  # GET /ykt_sessions/1
  # GET /ykt_sessions/1.json
  def show
    @ykt_session = YktSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ykt_session }
    end
  end

  # GET /ykt_sessions/new
  # GET /ykt_sessions/new.json
  def new
    @ykt_session = YktSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ykt_session }
    end
  end

  # GET /ykt_sessions/1/edit
  def edit
    @ykt_session = YktSession.find(params[:id])
  end

  # POST /ykt_sessions
  # POST /ykt_sessions.json
  def create
    @ykt_session = YktSession.new(params[:ykt_session])

    respond_to do |format|
      if @ykt_session.save
        format.html { redirect_to @ykt_session, notice: 'Ykt session was successfully created.' }
        format.json { render json: @ykt_session, status: :created, location: @ykt_session }
      else
        format.html { render action: "new" }
        format.json { render json: @ykt_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ykt_sessions/1
  # PUT /ykt_sessions/1.json
  def update
    @ykt_session = YktSession.find(params[:id])

    respond_to do |format|
      if @ykt_session.update_attributes(params[:ykt_session])
        format.html { redirect_to @ykt_session, notice: 'Ykt session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ykt_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ykt_sessions/1
  # DELETE /ykt_sessions/1.json
  def destroy
    @ykt_session = YktSession.find(params[:id])
    @ykt_session.destroy

    respond_to do |format|
      format.html { redirect_to ykt_sessions_url }
      format.json { head :no_content }
    end
  end
end
