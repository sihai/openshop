Ext.define('meetup.form.FileChooseField', {
    extend: 'Ext.form.TextField',
    alias: 'widget.filechoosefield',
	
	requires: [
        'meetup.view.FileChooser'
    ],
    
    // Add specialkey listener
    initComponent: function() {
        this.callParent();
        this.on('focus', this.showChooser, this);
    },

    // 
    showChooser: function(field, e) {
    	//Ext.MessageBox.alert("Haha");
    	var me = this;
    	meetup.current.getFileChooser(this.getEl(), function(image) {
    		me.setValue(image.data.url);
    	}).show();
    }
});