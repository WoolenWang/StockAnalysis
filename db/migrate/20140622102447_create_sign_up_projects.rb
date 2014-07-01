class CreateSignUpProjects < ActiveRecord::Migration
  def change
    create_table :sign_up_projects do |t|

      t.timestamps
    end
  end
end
