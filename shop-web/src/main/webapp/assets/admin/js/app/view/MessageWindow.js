Ext.define('MyDesktop.MessageWindow', {
    extend: 'Ext.ux.desktop.Module',

    requires: [
        'Ext.data.Store',
        'Ext.tree.Panel',
        'Ext.util.Format',
        'Ext.grid.Panel',
        'Ext.grid.RowNumberer',
        'meetup.model.Message',
        'Ext.PagingToolbar',
        'meetup.store.MessageStore',
        'meetup.form.FileChooseField'
    ],

    id:'message-win',

    init : function(){
        this.launcher = {
            text: '消息',
            iconCls:'message'
        };
    },

    createGrid : function() {
    	var store = Ext.create('meetup.store.MessageStore');
    	var rowEditor = Ext.create('Ext.grid.plugin.RowEditing', {
    		clicksToMoveEditor: 2,
    		autoCancel: false,
    		saveBtnText: '保存',  
    		cancelBtnText: "取消",
            listeners: {
                cancelEdit: function(rowEditing, context) {
                    // Canceling editing of a locally added, unsaved record: remove it
                    if (context.record.phantom) {
                    	store.remove(context.record);
                    }
                },
                'afteredit':function(editor, obj) {
        			obj.grid.getStore().sync();
        		}
            }
        });
    	
    	var grid = Ext.create('Ext.grid.Panel', {
            width: 1000,
            height: 600,
            frame: true,
            title: '消息列表',
            store: store,
            iconCls: 'icon-user',
            columns: [ {
                text: '编号',
                width: 120,
                sortable: true,
                dataIndex: 'id'
            }, {
                text: '类型',
                width: 120,
                sortable: true,
                dataIndex: 'type',
                renderer:function(value, p, record){
					return '<span style="color:green;">' + messageTypeMap[value] + '</span>';
				},
				editor: Ext.create('Ext.form.ComboBox', {
		        　　store: messageTypeStore,  
		        　　emptyText: '请选择类型',
		        　　mode: 'local',  
		        　　triggerAction: 'all',  
		        　　valueField: 'value',  
		        　　displayField: 'text',  
		        　　editable:false
				})
            }, {
                header: '？广播消息',
                width: 80,
                sortable: true,
                dataIndex: 'isBroadcast'
            }, {
                header: '状态',
                width: 80,
                sortable: true,
                dataIndex: 'status',
                renderer:function(value, p, record){
					return '<span style="color:green;">' + messageStatusMap[value] + '</span>';
				}
            }, {
                header: '发送者',
                width: 120,
                sortable: true,
                dataIndex: 'sender'
            }, {
                text: '接收者',
                width: 120,
                sortable: false,
                dataIndex: 'receiver'
            },{
                text: '内容',
                width: 300,
                sortable: false,
                dataIndex: 'content',
                field: {
                    xtype: 'textarea'
                }
            }],
            dockedItems: [/*{
                xtype: 'toolbar',
                items: [{
                    text: '创建',
                    iconCls: 'icon-add',
                    handler: function(){
                        store.insert(0, new Square());
                        rowEditing.startEdit(0, 0);
                    }
                }, '-', {
                    itemId: 'delete',
                    text: '删除',
                    iconCls: 'icon-delete',
                    disabled: true,
                    handler: function(){
                        var selection = grid.getView().getSelectionModel().getSelection()[0];
                        if (selection) {
                            store.remove(selection);
                        }
                    }
                }]
            }*/],
            
            bbar: Ext.create('Ext.PagingToolbar', {
	            pageSize: 20,
	            store: store,
	            displayInfo: true,
	            displayMsg: '显示 {0} - {1} of {2}',
	            emptyMsg: "没有数据",
	            items:[
	                '-', {
	                pressed: true,
	                enableToggle:true,
	                text: 'Show Preview',
	                cls: 'x-btn-text-icon details',
	                toggleHandler: function(btn, pressed){
	                    var view = grid.getView();
	                    view.showPreview = pressed;
	                    view.refresh();
	                }
	            }]
	        }),
    	
            /*bbar: Ext.create('Ext.PagingToolbar', {
                pageSize: 20,
                store: store,
                displayInfo: true,
                plugins: Ext.create('Ext.ux.SlidingPager', {})
            })*/
	        createMember: function() {
	        	store.insert(0, new meetup.model.Square());
	        	rowEditor.startEdit(0, 0);
	        },
	        deleteSelected: function() {
	        	 var selection = this.getView().getSelectionModel().getSelection()[0];
                 if (selection) {
                     store.remove(selection);
                 }
	        },
	        plugins: [rowEditor]
        });
    	
        return grid;
    },

    createWindow : function(){
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('message-win');

        if (!win) {
        	var grid = this.createGrid();
            win = desktop.createWindow({
                id: 'message-win',
                title: '消息管理',
                width: 1010,
                height: 600,
                iconCls: 'message',
                animCollapse: false,
                constrainHeader: true,
                bodyBorder: Ext.themeName !== 'neptune',
                tbar: {
                    xtype: 'toolbar',
                    ui: 'plain',
                    items: [{
                        tooltip:{title:'Rich Tooltips', text:'Let your users know what they can do!'},
                        iconCls:'connect'
                    },
                    '-',
                    {
                    	itemId: 'add',
                        tooltip:'推送消息',
                        iconCls:'user-add',
                        handler: function() {
                        	grid.createSquare();
                        }
                    }]
                },

                layout: 'accordion',
                border: false,

                items: [
                    grid
                ]
            });
        }

        return win;
    }
});