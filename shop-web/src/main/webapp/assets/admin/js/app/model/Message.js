Ext.define('meetup.model.Message', {
    extend: 'Ext.data.Model',

    requires: [
               'Ext.data.Types'
               ],
    idProperty: 'id',

    fields: [
        { name: 'status', type: 'int'},
        { name: 'type', type: 'int'},
        { name: 'isBroadcast', type: 'bool'},
        { name: 'sender', type: 'string'},
        { name: 'receiver', type: 'string'},
        { name: 'content', type: 'string'}
    ],
    
    validations: []
});