# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
page_init = ->
    #Ext.MessageBox.alert("ExtJS", "Hello ExtJS")
    #Ext.require("MyApp.UserRegesterWin");
    user_regest_win = Ext.create 'MyWin.UserRegisterWin',{}
#        title: '创建用户'
#        width: 300
#        height: 200
    user_regest_win.show()
    return

Ext.onReady page_init
