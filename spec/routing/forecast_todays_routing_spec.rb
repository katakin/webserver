require "spec_helper"

describe ForecastTodaysController do
  describe "routing" do

    it "routes to #index" do
      get("/forecast_todays").should route_to("forecast_todays#index")
    end

    it "routes to #new" do
      get("/forecast_todays/new").should route_to("forecast_todays#new")
    end

    it "routes to #show" do
      get("/forecast_todays/1").should route_to("forecast_todays#show", :id => "1")
    end

    it "routes to #edit" do
      get("/forecast_todays/1/edit").should route_to("forecast_todays#edit", :id => "1")
    end

    it "routes to #create" do
      post("/forecast_todays").should route_to("forecast_todays#create")
    end

    it "routes to #update" do
      put("/forecast_todays/1").should route_to("forecast_todays#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/forecast_todays/1").should route_to("forecast_todays#destroy", :id => "1")
    end

  end
end
