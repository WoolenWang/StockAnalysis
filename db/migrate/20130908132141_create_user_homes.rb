# -*- encoding : utf-8 -*-
class CreateUserHomes < ActiveRecord::Migration
  def change
    create_table :user_homes do |t|
      t.integer :user_id   # one user has one user_homes

      t.timestamps
    end
  end
end
