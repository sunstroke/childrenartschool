require "spec_helper"

describe LiveNewsController do
  describe "routing" do

    it "routes to #index" do
      get("/live_news").should route_to("live_news#index")
    end

    it "routes to #new" do
      get("/live_news/new").should route_to("live_news#new")
    end

    it "routes to #show" do
      get("/live_news/1").should route_to("live_news#show", :id => "1")
    end

    it "routes to #edit" do
      get("/live_news/1/edit").should route_to("live_news#edit", :id => "1")
    end

    it "routes to #create" do
      post("/live_news").should route_to("live_news#create")
    end

    it "routes to #update" do
      put("/live_news/1").should route_to("live_news#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/live_news/1").should route_to("live_news#destroy", :id => "1")
    end

  end
end
