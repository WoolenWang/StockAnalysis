class DesktopIcon < ActiveRecord::Base
  attr_accessible :title, :url, :win_height, :win_width
    belongs_to :user_home
end
