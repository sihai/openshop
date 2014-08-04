Ext.define('meetup.view.Login', {
	extend : 'Ext.window.Window',
	alias : 'widget.login',
	autoShow : true,
	height: 170,
    width: 360,
	layout : {
		type : 'fit'
	},
	iconCls : 'key',
	title : "请登陆",
	closeAction : 'hide',
	closable : false,

	items : [ {
		xtype : 'form',
		frame : false,
		bodyPadding : 15,
		defaults : {
			xtype : 'textfield',
			anchor : '100%',
			labelWidth : 60
		},
		items : [ {
			name : 'name',
			fieldLabel : "用户名",
			allowBlank : false,
			//vtype: 'alphanum',
			minLength : 2,
			maxLength : 32,
			msgTarget : 'under'
		}, {
			inputType : 'password',
			name : 'password',
			fieldLabel : "密码",
			allowBlank : false,
			//vtype: 'alphanum',
			minLength : 2,
			maxLength : 32,
			msgTarget : 'under'
		} ]
	} ],

	dockedItems : [ {
		xtype : 'toolbar',
		dock : 'bottom',
		items : [ {
			xtype : 'tbfill'
		}, {
			xtype : 'button',
			itemId : 'register',
			iconCls : 'link',
			text : '注册'
		}
		, {
			xtype : 'button',
			itemId : 'login_cancel',
			iconCls : 'cancel',
			text : '取消'
		}, {
			xtype : 'button',
			itemId : 'login_submit',
			formBind : true,
			iconCls : 'key-go',
			text : "提交"
		} ]
	} ]
});

