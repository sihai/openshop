Ext.define('meetup.model.Location', {
    extend: 'Ext.data.Model',

    requires: [
               'Ext.data.Types'
               ],
    idProperty: 'id',

    fields: [
        { name: 'longitude', type: 'double'},
        { name: 'latitude', type: 'double'}
    ],
    
    validations: []
});