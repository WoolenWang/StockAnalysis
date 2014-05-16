require 'spec_helper'

describe "stock_market_invest_logs/index" do
  before(:each) do
    assign(:stock_market_invest_logs, [
      stub_model(StockMarketInvestLog,
        :account_id => 1,
        :operation => "Operation",
        :profit => 1.5,
        :policy => "Policy"
      ),
      stub_model(StockMarketInvestLog,
        :account_id => 1,
        :operation => "Operation",
        :profit => 1.5,
        :policy => "Policy"
      )
    ])
  end

  it "renders a list of stock_market_invest_logs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Operation".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Policy".to_s, :count => 2
  end
end
