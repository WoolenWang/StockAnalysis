# -*- encoding : utf-8 -*-
class AddUserDeskTopTestData < ActiveRecord::Migration
  def up
      user = User.create(:username => 'admin',:encrypted_passwd => Digest::MD5.hexdigest('admin'),:email => 'admin@woolen.com')
      icons = []
      4.times do |count|
          icons << DesktopIcon.create(:title => "baidu_#{count}",:url => 'http://www.baidu.com',:win_width => 1100 ,:win_height => 650,
                             :identify_name => "baidu_#{count}",:icon_path => '/assets/user_home/icon/icon6.png')
      end
      icons1 = []
      9.times do |count|
          icons1 << DesktopIcon.create(:title => "baidu_#{count+10}",:url => 'http://www.baidu.com',:win_width => 1100 ,:win_height => 650,
                                       :identify_name => "baidu_#{count+10}",:icon_path => '/assets/user_home/icon/icon6.png')
      end
      icons2 = []
      5.times do |count|
          icons2 << DesktopIcon.create(:title => "baidu_#{count+70}",:url => 'http://www.baidu.com',:win_width => 1100 ,:win_height => 650,
                                      :identify_name => "baidu_#{count+70}",:icon_path => '/assets/user_home/icon/icon6.png')
      end
      icons3 = []
      6.times do |count|
          icons3 << DesktopIcon.create(:title => "baidu_#{count+20}",:url => 'http://www.baidu.com',:win_width => 1100 ,:win_height => 650,
                                       :identify_name => "baidu_#{count+20}",:icon_path => '/assets/user_home/icon/icon6.png')
      end
      icons4 = []
      7.times do |count|
          icons4 << DesktopIcon.create(:title => "baidu_#{count+30}",:url => 'http://www.baidu.com',:win_width => 1100 ,:win_height => 650,
                                       :identify_name => "baidu_#{count+30}",:icon_path => '/assets/user_home/icon/icon6.png')
      end
      icons5 = []
      7.times do |count|
          icons5 << DesktopIcon.create(:title => "baidu_#{count+40}",:url => 'http://www.baidu.com',:win_width => 1100 ,:win_height => 650,
                                       :identify_name => "baidu_#{count+40}",:icon_path => '/assets/user_home/icon/icon6.png')
      end
      layouts = []
      layouts << Layout.create(:location => 0,:order => 'a b c d e f',:desktop_icons => icons)
      layouts << Layout.create(:location => 1,:order => 'a b c d e f',:desktop_icons => icons1)
      layouts << Layout.create(:location => 2,:order => 'h i j k',:desktop_icons => icons2)
      layouts << Layout.create(:location => 3,:order => 'h i j k',:desktop_icons => icons3)
      layouts << Layout.create(:location => 4,:order => 'h i j k',:desktop_icons => icons4)
      layouts << Layout.create(:location => 5,:order => 'h i j k',:desktop_icons => icons5)
      user.user_home = UserHome.create(:layouts => layouts)
  end

  def down

  end
end
