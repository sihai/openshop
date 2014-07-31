Ext.define('meetup.view.Header', {
    extend: 'Ext.toolbar.Toolbar',
    alias: 'widget.appheader',

    height: 30,
    ui: 'footer',
    style: 'border-bottom: 4px solid #4c72a4;',
    items: [
        {
            xtype: 'label',
            html: '<div id="titleHeader">Meetup Server Console<span style="font-size:12px;"> - powered by openteach</span></div>'
        },
        {
            xtype: 'tbfill'
        },
        {
            xtype: 'translation'
        },
        {
            xtype: 'tbseparator'
        },
        {
            xtype: 'button',
            text: translations.logout,
            itemId: 'logout',
            iconCls: 'logout'
        }
    ]
});