# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
    attr_accessible :description, :email, :encrypted_passwd, :group_id, :group_name, :phone, :qq, :username
    has_one :menulist
    acts_as_authentic

    def valid_password?(passwd)
        Digest::MD5.hexdigest(passwd) == self.encrypted_passwd
    end
end

