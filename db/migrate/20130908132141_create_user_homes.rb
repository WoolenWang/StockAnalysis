class CreateUserHomes < ActiveRecord::Migration
  def change
    create_table :user_homes do |t|
      t.string :user_name
      t.string :layout

      t.timestamps
    end
  end
end
