require "spec_helper"

describe StockMarketInvestLogsController do
  describe "routing" do

    it "routes to #index" do
      get("/stock_market_invest_logs").should route_to("stock_market_invest_logs#index")
    end

    it "routes to #new" do
      get("/stock_market_invest_logs/new").should route_to("stock_market_invest_logs#new")
    end

    it "routes to #show" do
      get("/stock_market_invest_logs/1").should route_to("stock_market_invest_logs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stock_market_invest_logs/1/edit").should route_to("stock_market_invest_logs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stock_market_invest_logs").should route_to("stock_market_invest_logs#create")
    end

    it "routes to #update" do
      put("/stock_market_invest_logs/1").should route_to("stock_market_invest_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stock_market_invest_logs/1").should route_to("stock_market_invest_logs#destroy", :id => "1")
    end

  end
end
