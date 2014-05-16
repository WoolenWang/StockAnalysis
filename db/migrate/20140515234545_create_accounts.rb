# -*- encoding : utf-8 -*-
class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.float :money
      t.string :money_type
      t.integer :user_id  # one Account is belongs to a user

      t.timestamps
    end
  end
end
