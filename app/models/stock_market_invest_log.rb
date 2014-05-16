class StockMarketInvestLog < ActiveRecord::Base
    attr_accessible :account_id, :operation, :policy, :profit
    belongs_to :account
end
