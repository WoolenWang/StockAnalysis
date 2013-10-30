class DesktopIconsLayouts < ActiveRecord::Migration
  def up
      create_table :desktop_icons_layouts, :id => false do |t|
          t.integer :desktop_icon_id
          t.integer :layout_id
      end
  end

  def down
      drop_table :desktop_icons_layouts do
        true
      end
  end
end
