require "spec_helper"

describe SignUpProjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/sign_up_projects").should route_to("sign_up_projects#index")
    end

    it "routes to #new" do
      get("/sign_up_projects/new").should route_to("sign_up_projects#new")
    end

    it "routes to #show" do
      get("/sign_up_projects/1").should route_to("sign_up_projects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sign_up_projects/1/edit").should route_to("sign_up_projects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sign_up_projects").should route_to("sign_up_projects#create")
    end

    it "routes to #update" do
      put("/sign_up_projects/1").should route_to("sign_up_projects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sign_up_projects/1").should route_to("sign_up_projects#destroy", :id => "1")
    end

  end
end
