class DesktopIcon < ActiveRecord::Base
    attr_accessible :identify_name, :title, :url, :win_height, :win_width, :icon_path
    has_and_belongs_to_many :layouts
end
