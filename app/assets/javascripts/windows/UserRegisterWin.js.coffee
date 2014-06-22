Ext.define 'MyWin.UserRegisterWin',
    extend: 'Ext.window.Window'
    title: '注册用户'
    height: 270
    width: 450
    layout: 'fit'
    bodyStyle:
        background: 'url(/assets/background/gray-bg2.gif) repeat #00FFFF',
        padding: '10px'
    initComponent:()->
        this.submit = =>
            the_form_element = this.regist_form
            form = the_form_element.form
            form.doAction('submit',
                url : '/users/create'
                method : 'POST'
                success : (form,action)->
                    if action.result.success
                        Ext.Msg.alert('操作成功', action.result.msg)
                        the_form_element.up('window').close()
                    else
                        Ext.Msg.alert('操作失败', action.result.msg)
                failure : (form, action)->
                    if action.result
                        Ext.Msg.alert('警告', action.result.msg)
                    else
                        Ext.Msg.alert('警告', '输入有错，请修改')
            )
        this.regist_form = Ext.create 'Ext.form.Panel',
            items: [
                {
                    xtype: 'textfield'
                    name: 'user[username]'
                    maxLength: 128
                    fieldLabel: '用户名'
                    fieldTipStyle: 'icon'
                    fieldTipAlign: 'right'
                    fieldTip: '需要新建的用户名称'
                    anchor: '90%'
                    validator: ->
                        reg = new RegExp('^[0-9a-zA-Z_]*$')
                        is_match = reg.test(this.getValue())
                        return is_match if is_match
                        return '用户名只能为数字和字母'
                }
                {
                    xtype: 'textfield'
                    name: 'user[email]'
                    maxLength: 128
                    fieldLabel: '邮箱'
                    fieldTipStyle: 'icon'
                    fieldTipAlign: 'right'
                    fieldTip: '需要新建的用户邮箱'
                    anchor: '90%'
                    vtype: 'email'
                    vtypeText: '邮箱格式不正确'
                }
                {
                    xtype: 'textfield'
                    name: 'user[password]'
                    inputType: 'password'
                    maxLength: 128
                    fieldLabel: '密码'
                    fieldTipStyle: 'icon'
                    fieldTipAlign: 'right'
                    fieldTip: '需要新建的用户密码'
                    anchor: '90%'
                }
                {
                    xtype: 'textfield'
                    name: 'user[password_confirmation]'
                    inputType: 'password'
                    maxLength: 128
                    fieldLabel: '密码确认'
                    fieldTipStyle: 'icon'
                    fieldTipAlign: 'right'
                    fieldTip: '需要新建的用户密码再确认'
                    anchor: '90%'
                }
            ]
            bodyStyle:
                background: 'url(/assets/background/gray-bg2.gif) repeat #00FFFF',
                padding: '10px'
        this.buttons=[
            {
                xtype: 'button'
                name: 'submit'
                text: '注册'
                handler: =>
                    this.submit()
            }
            {
                xtype: 'button'
                name: 'calcel'
                text: '取消'
                handler: =>
                    this.close()
            }
        ]
        this.items=[this.regist_form]
        this.callParent(arguments)

