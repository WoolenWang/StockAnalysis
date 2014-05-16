require 'spec_helper'

describe "stock_market_invest_logs/show" do
  before(:each) do
    @stock_market_invest_log = assign(:stock_market_invest_log, stub_model(StockMarketInvestLog,
      :account_id => 1,
      :operation => "Operation",
      :profit => 1.5,
      :policy => "Policy"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Operation/)
    rendered.should match(/1.5/)
    rendered.should match(/Policy/)
  end
end
