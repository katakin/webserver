require "spec_helper"

describe PrognozsController do
  describe "routing" do

    it "routes to #index" do
      get("/prognozs").should route_to("prognozs#index")
    end

    it "routes to #new" do
      get("/prognozs/new").should route_to("prognozs#new")
    end

    it "routes to #show" do
      get("/prognozs/1").should route_to("prognozs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/prognozs/1/edit").should route_to("prognozs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/prognozs").should route_to("prognozs#create")
    end

    it "routes to #update" do
      put("/prognozs/1").should route_to("prognozs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/prognozs/1").should route_to("prognozs#destroy", :id => "1")
    end

  end
end
