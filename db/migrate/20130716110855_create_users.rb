# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
    def change
	create_table :users do |t|
	    t.string :username
	    t.string :encrypted_passwd
	    t.string :email
	    t.string :phone
	    t.string :qq
	    t.string :description
	    t.string :group_name
	    t.string :group_id
	    t.integer :login_count, :null => false, :default => 0
	    t.integer :failed_login_count, :null => false, :default => 0

	    t.datetime  :last_request_at
	    t.datetime  :current_login_at
	    t.datetime  :last_login_at
	    t.string    :current_login_ip
	    t.string    :last_login_ip

	    t.string    :persistence_token,   :null => false
	    t.string    :single_access_token, :null => false                # optional, see Authlogic::Session::Params
	    t.string    :perishable_token,    :null => false                # optional, see Authlogic::Session::Perishability

	    t.timestamps
	end
    end
end

