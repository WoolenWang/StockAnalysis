require 'spec_helper'

describe "accounts/new" do
  before(:each) do
    assign(:account, stub_model(Account,
      :account_type => "MyString",
      :money => 1.5,
      :money_type => "MyString"
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", accounts_path, "post" do
      assert_select "input#account_account_type[name=?]", "account[account_type]"
      assert_select "input#account_money[name=?]", "account[money]"
      assert_select "input#account_money_type[name=?]", "account[money_type]"
    end
  end
end
