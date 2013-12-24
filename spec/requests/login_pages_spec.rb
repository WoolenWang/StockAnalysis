# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "LoginPages" do
    describe "GET /login_pages" do
        it '登录页面应该有username 和 password' do
            # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
            get login_path
            response.status.should be(200)
            visit login_path
            page.should have_content 'Username'
            page.should have_content 'Password'
        end


        it '登录页面应该有输入用户名和密码的地方' do
            visit login_path
            page.should have_selector 'input', visible:true
        end
    end
end
