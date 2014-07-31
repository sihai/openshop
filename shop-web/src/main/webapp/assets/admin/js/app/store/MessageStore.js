Ext.define('meetup.store.MessageStore', {
    extend: 'Ext.data.Store',

    requires: [
        'meetup.util.FormWriter',
        'meetup.model.Message'
    ],

    model: 'meetup.model.Message',
    storeId: 'messageStore',
    pageSize: 20,
    autoLoad: true,
    autoSync: true,
    proxy: {
         type: 'ajax',
         api: {
            read: '/message_action.jhtml?_operation_=_query_',		//查询
            create: '/message_action.jhtml?_operation_=_create_',	//创建
            update: '/message_action.jhtml?_operation_=_update_',	//更新
            destroy: '/message_action.jhtml?_operation_=_delete_'	//删除
        },
        reader: {
            type: 'json',
            root: 'result.itemList',
            totalProperty: 'result.totalItem'
        },
        writer: {
            type: 'formwriter'
        }
    },
    listeners: {
        write: function(store, operation) {
            var record = operation.getRecords()[0],
                name = Ext.String.capitalize(operation.action),
                verb;
                
            if (name == 'Destroy') {
                record = operation.records[0];
                verb = 'Destroyed';
            } else {
                verb = name + 'd';
            }
            Ext.example.msg(name, Ext.String.format("{0} user: {1}", verb, record.getId()));
            
        }
    }
});