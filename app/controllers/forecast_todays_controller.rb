class ForecastTodaysController < ApplicationController
  # GET /forecast_todays
  # GET /forecast_todays.json
  def index
    @forecast_todays = ForecastToday.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@forecast_todays, :mode => :compat) }
    end
  end

  # GET /forecast_todays/1
  # GET /forecast_todays/1.json
  # def show
  #   @forecast_today = ForecastToday.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @forecast_today }
  #   end
  # end

  # # GET /forecast_todays/new
  # # GET /forecast_todays/new.json
  # def new
  #   @forecast_today = ForecastToday.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @forecast_today }
  #   end
  # end

  # # GET /forecast_todays/1/edit
  # def edit
  #   @forecast_today = ForecastToday.find(params[:id])
  # end

  # # POST /forecast_todays
  # # POST /forecast_todays.json
  # def create
  #   @forecast_today = ForecastToday.new(params[:forecast_today])

  #   respond_to do |format|
  #     if @forecast_today.save
  #       format.html { redirect_to @forecast_today, notice: 'Forecast today was successfully created.' }
  #       format.json { render json: @forecast_today, status: :created, location: @forecast_today }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @forecast_today.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PUT /forecast_todays/1
  # # PUT /forecast_todays/1.json
  # def update
  #   @forecast_today = ForecastToday.find(params[:id])

  #   respond_to do |format|
  #     if @forecast_today.update_attributes(params[:forecast_today])
  #       format.html { redirect_to @forecast_today, notice: 'Forecast today was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @forecast_today.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /forecast_todays/1
  # # DELETE /forecast_todays/1.json
  # def destroy
  #   @forecast_today = ForecastToday.find(params[:id])
  #   @forecast_today.destroy

  #   respond_to do |format|
  #     format.html { redirect_to forecast_todays_url }
  #     format.json { head :no_content }
  #   end
  # end
end
