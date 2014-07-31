Ext.define('meetup.controller.FileChooser', {
	extend : 'Ext.app.Controller',
	
	requires: [
	           'meetup.util.MD5',
	           'meetup.view.FileChooser',
	           'meetup.util.SessionMonitor'
	       ],

	views : [ 'FileChooser'],
	
	refs: [
	       {ref: 'ui', selector: 'FileChooser' }
	],
	
	init : function() {
		//Ext.MessageBox.alert('FileChooser controller init');
		this.control({
			"filefield#file" : {
				change : this.onUpload
			},
		});
		//Ext.MessageBox.alert("Haha");
	},

	onUpload: function(field, newValue) {
		var me = this;
		form = field.up('form').getForm();
		if (form.isValid()) {
			//Ext.get(form.getEl()).mask("上传中... 请稍等...", 'loading');
			form.submit({
				url : 'upload_action.jhtml?_operation_=_create_',
				waitMsg : '正在上传图片...',
				success : function(form, action) {
					form.reset();
					// insert into store
					me.getUi().getStore().add({id: action.result.image.id, url: action.result.image.url});
				},
				failure: function(form, action) {
					Ext.Msg.alert('提示', '原因如下：' + action.result.errorMsg);
				}
			});
		}
	}
});