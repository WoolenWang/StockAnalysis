# -*- encoding : utf-8 -*-
class Layout < ActiveRecord::Base
    attr_accessible :location, :desktop_icons, :order
    belongs_to :user_home,:inverse_of => :layouts
    has_and_belongs_to_many :desktop_icons
end
