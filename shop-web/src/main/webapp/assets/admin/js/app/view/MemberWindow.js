Ext.define('MyDesktop.MemberWindow', {
    extend: 'Ext.ux.desktop.Module',

    requires: [
        'Ext.data.Store',
        'Ext.tree.Panel',
        'Ext.util.Format',
        'Ext.grid.Panel',
        'Ext.grid.RowNumberer',
        'meetup.model.Member',
        'Ext.PagingToolbar',
        'meetup.store.MemberStore',
        'meetup.form.FileChooseField'
    ],

    id:'member-win',

    init : function(){
        this.launcher = {
            text: '会员',
            iconCls:'member'
        };
    },

    createGrid : function() {
    	var store = Ext.create('meetup.store.MemberStore');
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
            width: 1200,
            height: 600,
            frame: true,
            title: '会员列表',
            store: store,
            iconCls: 'icon-user',
            columns: [ {
            	name: 'logoURL',
                text: 'logo',
                width: 80,
                sortable: false,
                dataIndex: 'logoURL',
                renderer:function(value, p, record){
					return '<img style="width:74px;height:74px;" src="' + value + '"></img>';
				}
            }, {
                text: '编号',
                width: 80,
                sortable: true,
                dataIndex: 'id'
            }, {
                text: '名称',
                width: 120,
                sortable: true,
                dataIndex: 'name'
            }, {
                header: '性别',
                width: 80,
                sortable: true,
                dataIndex: 'gender',
                renderer:function(value, p, record){
					return '<span style="color:green;">' + genderMap[value] + '</span>';
				}
            }, {
                header: '邮箱',
                width: 80,
                sortable: true,
                dataIndex: 'email'
            }, {
                text: '手机',
                width: 80,
                sortable: false,
                dataIndex: 'mobile'
            },{
                text: '生日',
                width: 120,
                sortable: false,
                dataIndex: 'birthday'
            }, {
                text: '当前位置',
                width: 300,
                sortable: true,
                dataIndex: 'currentLocation',
                renderer:function(value, p, record){
                	if(value) {
                		return '<span style="color:green;">经度：' + value.longitude + ', 纬度：' + value.latitude + '</span>';
                	}
				}
            }, {
                text: '心情',
                width: 200,
                sortable: true,
                dataIndex: 'mood'
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
    	
    	grid.getSelectionModel().on('selectionchange', function(selModel, selections){
            grid.up("window").down('#delete').setDisabled(selections.length === 0);
        });
        return grid;
    },

    createWindow : function(){
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('member-win');

        if (!win) {
        	var grid = this.createGrid();
            win = desktop.createWindow({
                id: 'member-win',
                title: '会员管理',
                width: 1210,
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
                        tooltip:'创建会员',
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