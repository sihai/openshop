Ext.define('MyDesktop.SquareWindow', {
    extend: 'Ext.ux.desktop.Module',

    requires: [
        'Ext.data.Store',
        'Ext.tree.Panel',
        'Ext.util.Format',
        'Ext.grid.Panel',
        'Ext.grid.RowNumberer',
        'meetup.model.Square',
        'Ext.PagingToolbar',
        'meetup.store.SquareStore',
        'meetup.form.FileChooseField'
    ],

    id:'square-win',

    init : function(){
        this.launcher = {
            text: '广场',
            iconCls:'square'
        };
    },

    createGrid : function() {
    	var store = Ext.create('meetup.store.SquareStore');
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
            width: 900,
            height: 600,
            frame: true,
            title: '广场列表',
            store: store,
            iconCls: 'icon-user',
            columns: [{
            	name: 'photoURL',
                text: '图标',
                width: 80,
                sortable: false,
                dataIndex: 'photoURL',
                renderer:function(value, p, record){
					return '<img style="width:74px;height:74px;" src="' + value + '"></img>';
				},
				field: {
                    xtype: 'filechoosefield'
                }
            },{
                text: '编号',
                width: 80,
                sortable: true,
                dataIndex: 'id'
            }, {
                text: '名称',
                width: 120,
                sortable: true,
                dataIndex: 'name',
                field: {
                    xtype: 'textfield'
                }
            }, {
                header: '类型',
                width: 80,
                sortable: true,
                dataIndex: 'type',
                renderer:function(value, p, record){
					return '<span style="color:green;">' + squareTypeMap[value] + '</span>';
				},
				editor: Ext.create('Ext.form.ComboBox', {
		        　　store: squareTypeStore,  
		        　　emptyText: '请选择类型',
		        　　mode: 'local',  
		        　　triggerAction: 'all',  
		        　　valueField: 'value',  
		        　　displayField: 'text',  
		        　　editable:false
				})
            }, {
                text: 'tagLine',
                width: 200,
                sortable: false,
                dataIndex: 'tagLine',
                field: {
                    xtype: 'textfield'
                }
            }, {
                text: '描述',
                width: 200,
                sortable: false,
                dataIndex: 'aboutText',
                field: {
                    xtype: 'textarea'
                }
            }, {
                text: '是否允许加入',
                width: 80,
                sortable: true,
                dataIndex: 'isJoinability',
                field: {
                    xtype: 'textfield'
                },
                renderer:function(value, p, record){
                	if(value) {
                		return '<span style="color:green;">YES</span>';
                	} else {
                		return '<span style="color:red;">NO</span>';
                	}
				}
            }, {
                text: '人数',
                width: 80,
                sortable: true,
                dataIndex: 'memberCount',
                field: {
                    xtype: 'textfield'
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
	        createSquare: function() {
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
    	
    	grid.getSelectionModel().on('selectionchange', function(selModel, selections){
            grid.up("window").down('#delete').setDisabled(selections.length === 0);
        });
        return grid;
    },

    createWindow : function(){
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('square-win');

        if (!win) {
        	var grid = this.createGrid();
            win = desktop.createWindow({
                id: 'square-win',
                title: '广场管理',
                width: 910,
                height: 600,
                iconCls: 'square',
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
                        tooltip:'创建广场',
                        iconCls:'user-add',
                        handler: function() {
                        	grid.createSquare();
                        }
                    },
                    ' ',
                    {
                    	itemId: 'delete',
                        tooltip:'删除',
                        iconCls:'user-delete',
                        handler: function() {
                        	grid.deleteSelected();
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