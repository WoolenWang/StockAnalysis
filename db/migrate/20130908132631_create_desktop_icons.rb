# -*- encoding : utf-8 -*-
class CreateDesktopIcons < ActiveRecord::Migration
    def change
        create_table :desktop_icons do |t|
            t.string :title
            t.string :url
            t.integer :win_width
            t.integer :win_height
            t.string :identify_name
            t.string :icon_path

            t.timestamps
        end
    end
end
