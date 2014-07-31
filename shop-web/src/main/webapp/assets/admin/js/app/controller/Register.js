Ext.define('meetup.controller.Register', {
	extend : 'Ext.app.Controller',
	
	requires: [
	           'meetup.util.MD5',
	           'meetup.view.Login',
	           'meetup.view.Main',
	           'meetup.util.SessionMonitor'
	       ],

	views : [ 'Register', 'Header', 'authentication.CapsLockTooltip' ],
	refs : [ {
		ref : 'capslockTooltip',
		selector : 'capslocktooltip'
	} ],

	init : function() {
		this.control({
			"button#register_login" : {
				click : this.onButtonClickLogin
			},
			"button#register_submit" : {
				click : this.onButtonClickSubmit
			},
			"button#register_cancel" : {
				click : this.onButtonClickCancel
			},
			"textfield" : {
				specialkey : this.onTextfielSpecialKey
			},
			"textfield[name=password]" : {
				keypress : this.onTextfielKeyPress
			}
		});
		//Ext.MessageBox.alert("Haha");
	},
	
	onButtonClickLogin : function(button, e, options) {
		var register = button.up('register');
		register.close();
        Ext.create('meetup.view.Login');
	},
	
	onButtonClickSubmit : function(button, e, options) {
		var register = button.up('register');
		var formPanel = register.down('form');
		var name = formPanel.down('textfield[name=name]').getValue();
		var password = formPanel.down('textfield[name=password]').getValue();
		if (formPanel.getForm().isValid()) {
			Ext.get(register.getEl()).mask("注册中... 请稍等...", 'loading');
			Ext.Ajax.request({
				url : '/admin_user_action.jhtml',
				params : {
					_operation_ : '_register_',
					name : name,
					password : password
				},
				success : function(response, opts) {
					Ext.get(register.getEl()).unmask();
					var result = Ext.decode(response.responseText);
					if (!result.isSucceed) {
						Ext.MessageBox.alert('错误', result.errorMsg);
						return;
					}
					register.close();
					meetup.current.startWindows();
				},
				failure : function(response, opts) {
					Ext.get(register.getEl()).unmask();
					Ext.MessageBox.alert('错误', "提交失败");
				}
			});
		}
	},

	onButtonClickCancel : function(button, e, options) {
		button.up('register').down('form').getForm().reset();
	},

	onTextfielSpecialKey : function(field, e, options) {
		if (e.getKey() == e.ENTER) {
			var submitBtn = field.up('form').up('register').down('button#submit');
			submitBtn.fireEvent('click', submitBtn, e, options);
		}
	},

	onTextfielKeyPress : function(field, e, options) {
		var charCode = e.getCharCode();

		if ((e.shiftKey && charCode >= 97 && charCode <= 122)
				|| (!e.shiftKey && charCode >= 65 && charCode <= 90)) {

			if (this.getCapslockTooltip() === undefined) {
				Ext.widget('capslocktooltip');
			}

			this.getCapslockTooltip().show();

		} else {

			if (this.getCapslockTooltip() !== undefined) {
				this.getCapslockTooltip().hide();
			}
		}
	}
});