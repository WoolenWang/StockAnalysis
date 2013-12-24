# -*- encoding : utf-8 -*-
class UserHome < ActiveRecord::Base
    attr_accessible :layouts
    has_many :layouts,:dependent => :destroy,:inverse_of => :user_home
    belongs_to :user,:inverse_of => :user_home
end
