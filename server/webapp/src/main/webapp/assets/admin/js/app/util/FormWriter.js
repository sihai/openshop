Ext.define('meetup.util.FormWriter', {
	extend : 'Ext.data.writer.Writer',
	alternateClassName : 'Ext.util.FormWriter',
	alias : 'writer.formwriter',
	writeRecords : function(request, data) {
		if (data && data[0]) {
			var keys = [];
			for ( var key in data[0]) {
				keys.push(key);
			}
			for ( var i = 0; i < keys.length; i++) {
				request.params[keys[i]] = [];
				for ( var j = 0; j < data.length; j++) {
					request.params[keys[i]].push((data[j])[keys[i]]);
				}
			}
		}
		return request;
	}
});