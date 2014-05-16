require 'spec_helper'

describe "stock_market_invest_logs/new" do
  before(:each) do
    assign(:stock_market_invest_log, stub_model(StockMarketInvestLog,
      :account_id => 1,
      :operation => "MyString",
      :profit => 1.5,
      :policy => "MyString"
    ).as_new_record)
  end

  it "renders new stock_market_invest_log form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stock_market_invest_logs_path, "post" do
      assert_select "input#stock_market_invest_log_account_id[name=?]", "stock_market_invest_log[account_id]"
      assert_select "input#stock_market_invest_log_operation[name=?]", "stock_market_invest_log[operation]"
      assert_select "input#stock_market_invest_log_profit[name=?]", "stock_market_invest_log[profit]"
      assert_select "input#stock_market_invest_log_policy[name=?]", "stock_market_invest_log[policy]"
    end
  end
end
