# -*- encoding : utf-8 -*-
class UserSession < Authlogic::Session::Base
    include ActiveModel::Conversion

    def to_key
        new_record? ? nil : [self.send(self.class.primary_key)]
    end
end
