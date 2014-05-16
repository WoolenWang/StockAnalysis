class CreateStockMarketInvestLogs < ActiveRecord::Migration
  def change
    create_table :stock_market_invest_logs do |t|
      t.integer :account_id
      t.string :operation
      t.float :profit
      t.string :policy

      t.timestamps
    end
  end
end
