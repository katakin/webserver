require "spec_helper"

describe YktNewsController do
  describe "routing" do

    it "routes to #index" do
      get("/ykt_news").should route_to("ykt_news#index")
    end

    it "routes to #new" do
      get("/ykt_news/new").should route_to("ykt_news#new")
    end

    it "routes to #show" do
      get("/ykt_news/1").should route_to("ykt_news#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ykt_news/1/edit").should route_to("ykt_news#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ykt_news").should route_to("ykt_news#create")
    end

    it "routes to #update" do
      put("/ykt_news/1").should route_to("ykt_news#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ykt_news/1").should route_to("ykt_news#destroy", :id => "1")
    end

  end
end
