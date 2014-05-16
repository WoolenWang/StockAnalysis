require 'spec_helper'

describe SystemConsoleShowController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show_policy'" do
    it "returns http success" do
      get 'show_policy'
      response.should be_success
    end
  end

  describe "GET 'show_users'" do
    it "returns http success" do
      get 'show_users'
      response.should be_success
    end
  end

  describe "GET 'show_account'" do
    it "returns http success" do
      get 'show_account'
      response.should be_success
    end
  end

end
