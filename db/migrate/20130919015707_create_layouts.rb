class CreateLayouts < ActiveRecord::Migration
  def change
    create_table :layouts do |t|
      t.integer :location
      t.integer :user_home_id  # one layout is belongs to a user_homes
      t.string  :order  #order is an string that refer to the desktop icon order
      t.string :type

      t.timestamps
    end
  end
end
