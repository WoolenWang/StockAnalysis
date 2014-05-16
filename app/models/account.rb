class Account < ActiveRecord::Base
    attr_accessible :account_type, :money, :money_type
    belongs_to :user
end
