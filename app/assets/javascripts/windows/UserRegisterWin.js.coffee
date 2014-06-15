Ext.define 'MyWin.UserRegisterWin',
    extend: 'Ext.window.Window'
    title: '注册用户'
    height: 200
    width: 400
    layout: 'fit'
    items:[
        xtype: 'form'
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
                    reg.test(this.getValue());
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
                validator: ->
                    reg = new RegExp('^[a-zA-Z0-9_\.]+@[a-zA-Z0-9-]+[\.a-zA-Z]+$')
                    reg.test(this.getValue());
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
        buttons:[
            {
                xtype: 'button'
                name: 'submit'
                text: '注册'
                handler: ->
                    the_form_element = this.up('form')
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
            }
            {
                xtype: 'button'
                name: 'calcel'
                text: '取消'
                handler: ->
                    this.up('window').close()
            }
        ]
    ]
