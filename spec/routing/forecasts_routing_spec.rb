require "spec_helper"

describe ForecastsController do
  describe "routing" do

    it "routes to #index" do
      get("/forecasts").should route_to("forecasts#index")
    end

    it "routes to #new" do
      get("/forecasts/new").should route_to("forecasts#new")
    end

    it "routes to #show" do
      get("/forecasts/1").should route_to("forecasts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/forecasts/1/edit").should route_to("forecasts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/forecasts").should route_to("forecasts#create")
    end

    it "routes to #update" do
      put("/forecasts/1").should route_to("forecasts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/forecasts/1").should route_to("forecasts#destroy", :id => "1")
    end

  end
end
