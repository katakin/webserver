require "spec_helper"

describe YktSessionsController do
  describe "routing" do

    it "routes to #index" do
      get("/ykt_sessions").should route_to("ykt_sessions#index")
    end

    it "routes to #new" do
      get("/ykt_sessions/new").should route_to("ykt_sessions#new")
    end

    it "routes to #show" do
      get("/ykt_sessions/1").should route_to("ykt_sessions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ykt_sessions/1/edit").should route_to("ykt_sessions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ykt_sessions").should route_to("ykt_sessions#create")
    end

    it "routes to #update" do
      put("/ykt_sessions/1").should route_to("ykt_sessions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ykt_sessions/1").should route_to("ykt_sessions#destroy", :id => "1")
    end

  end
end
