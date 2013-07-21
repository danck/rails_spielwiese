require "spec_helper"

describe PflegeanbietersController do
  describe "routing" do

    it "routes to #index" do
      get("/pflegeanbieters").should route_to("pflegeanbieters#index")
    end

    it "routes to #new" do
      get("/pflegeanbieters/new").should route_to("pflegeanbieters#new")
    end

    it "routes to #show" do
      get("/pflegeanbieters/1").should route_to("pflegeanbieters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pflegeanbieters/1/edit").should route_to("pflegeanbieters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pflegeanbieters").should route_to("pflegeanbieters#create")
    end

    it "routes to #update" do
      put("/pflegeanbieters/1").should route_to("pflegeanbieters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pflegeanbieters/1").should route_to("pflegeanbieters#destroy", :id => "1")
    end

  end
end
