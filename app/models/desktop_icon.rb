class DesktopIcon < ActiveRecord::Base
  attr_accessible :icon_id,:title, :url, :win_height, :win_width
    belongs_to :user_home
end
