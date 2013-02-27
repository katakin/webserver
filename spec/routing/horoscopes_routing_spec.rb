require "spec_helper"

describe HoroscopesController do
  describe "routing" do

    it "routes to #index" do
      get("/horoscopes").should route_to("horoscopes#index")
    end

    it "routes to #new" do
      get("/horoscopes/new").should route_to("horoscopes#new")
    end

    it "routes to #show" do
      get("/horoscopes/1").should route_to("horoscopes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/horoscopes/1/edit").should route_to("horoscopes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/horoscopes").should route_to("horoscopes#create")
    end

    it "routes to #update" do
      put("/horoscopes/1").should route_to("horoscopes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/horoscopes/1").should route_to("horoscopes#destroy", :id => "1")
    end

  end
end
