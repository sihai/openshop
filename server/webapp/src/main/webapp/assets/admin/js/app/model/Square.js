Ext.define('meetup.model.Square', {
    extend: 'Ext.data.Model',

    requires: [
               'Ext.data.Types'
               ],
    idProperty: 'id',

    fields: [
        { name: 'name', type: 'string'},
        { name: 'type', type: 'int'},
        { name: 'tagLine', type: 'string'},
        { name: 'photoURL', type: 'string'},
        { name: 'aboutText', type: 'string'},
        { name: 'isJoinability', type: 'bool'},
        { name: 'memberCount', type: 'int'}
    ],
    
    validations: [{ 
    	type: 'length',
        field: 'name',
        min: 4
    }]
});