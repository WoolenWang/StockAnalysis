class UserHome < ActiveRecord::Base
  attr_accessible :layout, :user_name
    has_many :desktop_icons
    belongs_to :user
end
