Ext.define('meetup.model.Member', {
    extend: 'Ext.data.Model',

    requires: [
               'Ext.data.Types',
               'meetup.model.Location'
               ],
    idProperty: 'id',

    fields: [
        { name: 'name', type: 'string'},
        { name: 'gender', type: 'int'},
        { name: 'email', type: 'string'},
        { name: 'mobile', type: 'string'},
        { name: 'logoURL', type: 'string'},
        { name: 'birthday', type: 'date'},
        { name: 'type', type: 'int'},
        { name: 'currentLocation', type: 'location'},
        { name: 'mood', type: 'string'},
    ],
    
    validations: [{ 
    	type: 'length',
        field: 'name',
        min: 4
    }]
});