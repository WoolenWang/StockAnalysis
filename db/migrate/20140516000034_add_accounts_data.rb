# -*- encoding : utf-8 -*-
class AddAccountsData < ActiveRecord::Migration
    def up
        user = User.find_by_username('admin')
        user.accounts = []
        user.accounts << Account.create(:account_type => '股票账户',:money=> 32000.88,:money_type=>'RMB')
        user.accounts << Account.create(:account_type => '贵金属账户',:money=> 12000.88,:money_type=>'RMB')
        user.accounts << Account.create(:account_type => '基金账户',:money=> 12000.88,:money_type=>'RMB')
        user.accounts << Account.create(:account_type => '余额宝账户',:money=> 52000.88,:money_type=>'RMB')
        user.save
    end

    def down
        user = User.find_by_username('admin')
        user.accounts = []
        user.save
    end
end
