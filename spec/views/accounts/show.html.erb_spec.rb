require 'spec_helper'

describe "accounts/show" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :account_type => "Account Type",
      :money => 1.5,
      :money_type => "Money Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Account Type/)
    rendered.should match(/1.5/)
    rendered.should match(/Money Type/)
  end
end
