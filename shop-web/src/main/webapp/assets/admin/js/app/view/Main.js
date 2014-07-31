Ext.define('meetup.view.Main', {
	extend : 'Ext.window.Window',
	alias : 'widget.main',
	autoShow : true,
	height: '100%',
    width: '100%',
	layout : {
		type : 'fit'
	},
	iconCls : 'key',
	title : "请注册",
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
			name : 'user',
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
		},{
			xtype : 'button',
			itemId : 'cancel',
			iconCls : 'cancel',
			text : '取消'
		}, {
			xtype : 'button',
			itemId : 'submit',
			formBind : true,
			iconCls : 'key-go',
			text : "提交"
		} ]
	} ]
});

