require 'spec_helper'

describe "accounts/edit" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :account_type => "MyString",
      :money => 1.5,
      :money_type => "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", account_path(@account), "post" do
      assert_select "input#account_account_type[name=?]", "account[account_type]"
      assert_select "input#account_money[name=?]", "account[money]"
      assert_select "input#account_money_type[name=?]", "account[money_type]"
    end
  end
end
