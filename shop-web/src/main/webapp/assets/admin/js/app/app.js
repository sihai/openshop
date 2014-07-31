/* 动态加载依赖的前提 */
Ext.Loader.setConfig({
	enabled : true,
	paths : {
		'Extention' : 'js'// 设置一个扩展命名空间，区分工具生成的代码
	}
});

Ext.Loader.setPath({
    'Ext.ux.desktop': '/assets/js/app/view',
    'MyDesktop': '/assets/js/app/view',
    'meetup': '/assets/js/app'
});

Ext.application({

	extend: 'Ext.app.Application',
	
	mixins: {
	        observable: 'Ext.util.Observable'
	},
	
    requires: [
        'Ext.panel.Panel',
        'Ext.window.Window',
        'Ext.window.MessageBox',
        'Ext.container.Viewport',
        'Ext.ux.desktop.Desktop',
        'Ext.menu.Menu',
        'Ext.form.Panel',
        'Ext.layout.container.Accordion',
        'Ext.layout.container.Border',
        'Ext.form.field.Text',
        'Ext.form.field.ComboBox',
        'Ext.toolbar.TextItem',
        'Ext.layout.container.Fit',
        'Ext.form.Label',
        'Ext.data.proxy.Ajax',
        'Ext.form.FieldSet',
        'Ext.form.field.Hidden',
        'Ext.form.field.ComboBox',
        'Ext.form.field.File',
        'Ext.form.TextField',
        'Ext.grid.plugin.CellEditing',
        'Ext.grid.column.Date',
        'Ext.grid.column.Action',
        'Ext.chart.series.Pie',
        'Ext.chart.series.Column',
        'Ext.chart.axis.Numeric',
        'Ext.chart.axis.Category',
        'Ext.form.CheckboxGroup',
        
        'Ext.ux.desktop.ShortcutModel',

        'MyDesktop.SystemStatus',
        'MyDesktop.VideoWindow',
        'MyDesktop.GridWindow',
        'MyDesktop.TabWindow',
        'MyDesktop.AccordionWindow',
        'MyDesktop.Notepad',
        'MyDesktop.BogusMenuModule',
        'MyDesktop.BogusModule',
        
        'meetup.util.FormWriter',

//        'MyDesktop.Blockalanche',
        'MyDesktop.Settings',
        'MyDesktop.SquareWindow',
        'MyDesktop.MemberWindow',
        'MyDesktop.MessageWindow',
        
        'meetup.view.IconBrowser',
        'meetup.view.InfoPanel',
        'meetup.view.FileChooser',
        'meetup.form.FileChooseField'
    ],

	name : 'meetup',
	appFolder : '/assets/js/app',
	appProperty: 'current',
	views : [],
	controllers : [ 'Register', 'Login', 'FileChooser' ],
	autoCreateViewport : false,
	splashscreen : {},
	isReady : false,
	modules : null,
	useQuickTips : true,

	/*constructor : function(config) {
		var me = this;
		me.addEvents('ready', 'beforeunload');

		me.mixins.observable.constructor.call(this, config);

		if (Ext.isReady) {
			Ext.Function.defer(me.init, 10, me);
		} else {
			Ext.onReady(me.init, me);
		}
	},*/

	init : function() {
				
		// Start the mask on the body and get a reference to the mask
		splashscreen = Ext.getBody().mask('加载中...', 'splashscreen');

		// Add a new class to this mask as we want it to look different from the default.
		splashscreen.addCls('splashscreen');

		// Insert a new div before the loading icon where we can place our logo.
		Ext.DomHelper.insertFirst(Ext.query('.x-mask-msg')[0], {
			cls : 'x-splash-icon'
		});

		//console.log('init');
	},

	launch : function() {
		Ext.tip.QuickTipManager.init();
		var app = this;
		meetup[this.appProperty] = this;
		var task = new Ext.util.DelayedTask(function() {

			//Fade out the body mask
			splashscreen.fadeOut({
				duration : 1000,
				remove : true
			});

			//Fade out the icon and message
			splashscreen.next().fadeOut({
				duration : 1000,
				remove : true,
				listeners : {
					afteranimate : function(el, startTime, eOpts) {
						console.log('Call login');
						app.login();
					}
				}
			});
		});

		task.delay(2000);
	},
	
	login : function() {
		console.log('Try to login');
		var app = this;
		Ext.getBody().mask('登陆中...', 'splashscreen');
		Ext.Ajax.request({
			url : '/admin_user_action.jhtml',
			params : {
				_operation_ : '_is_logined_'
			},
			success : function(response, opts) {
				Ext.getBody().unmask();
				var result = Ext.decode(response.responseText);
				if (!result.isSucceed) {
					Ext.MessageBox.alert('错误', result.errorMsg);
				} else {
					if(result.result) {
						app.startWindows();
					} else {
						Ext.create('meetup.view.Login');
					}
				}
			},
			failure : function(response, opts) {
				Ext.getBody().unmask();
				Ext.MessageBox.alert('错误', "登陆失败");
			}
		});
	},
	
	startWindows : function() {
		var me = this, desktopCfg;

       /* if (me.useQuickTips) {
            Ext.QuickTips.init();
        }*/

        me.modules = me.getModules();
        if (me.modules) {
            me.initModules(me.modules);
        }

        desktopCfg = me.getDesktopConfig();
        me.desktop = new Ext.ux.desktop.Desktop(desktopCfg);

        me.viewport = new Ext.container.Viewport({
            layout: 'fit',
            items: [ me.desktop ]
        });

        Ext.EventManager.on(window, 'beforeunload', me.onUnload, me);

        me.isReady = true;
        me.fireEvent('ready', me);

	},
	
	 /**
     * This method returns the configuration object for the Desktop object. A derived
     * class can override this method, call the base version to build the config and
     * then modify the returned object before returning it.
     */
    getDesktopConfig: function () {
        var me = this, cfg = {
            app: me,
            taskbarConfig: me.getTaskbarConfig()
        };

        Ext.apply(cfg, me.desktopConfig);
        
        return Ext.apply(cfg, {
            //cls: 'ux-desktop-black',

            contextMenuItems: [
                { text: 'Change Settings', handler: me.onSettings, scope: me }
            ],

            shortcuts: Ext.create('Ext.data.Store', {
                model: 'Ext.ux.desktop.ShortcutModel',
                data: [
                    { name: 'Grid Window', iconCls: 'grid-shortcut', module: 'grid-win' },
                    { name: 'Accordion Window', iconCls: 'accordion-shortcut', module: 'acc-win' },
                    { name: 'Notepad', iconCls: 'notepad-shortcut', module: 'notepad' },
                    { name: 'System Status', iconCls: 'cpu-shortcut', module: 'systemstatus'},
                    { name: '广场管理', iconCls: 'square-shortcut', module: 'square-win' },
                    { name: '会员管理', iconCls: 'member-shortcut', module: 'member-win' },
                    { name: '消息管理', iconCls: 'message-shortcut', module: 'message-win' },
                ]
            }),

            wallpaper: '/assets/images/wallpapers/Blue-Sencha.jpg',
            wallpaperStretch: false
        });
    },

    getModules: function() {
    	return [
                new MyDesktop.VideoWindow(),
                //new MyDesktop.Blockalanche(),
                new MyDesktop.SystemStatus(),
                new MyDesktop.GridWindow(),
                new MyDesktop.TabWindow(),
                new MyDesktop.AccordionWindow(),
                new MyDesktop.Notepad(),
                new MyDesktop.BogusMenuModule(),
                new MyDesktop.BogusModule(),
                new MyDesktop.SquareWindow(),
                new MyDesktop.MemberWindow(),
                new MyDesktop.MessageWindow()
            ];
    },

    /**
     * This method returns the configuration object for the Start Button. A derived
     * class can override this method, call the base version to build the config and
     * then modify the returned object before returning it.
     */
    getStartConfig: function () {
        var me = this,
            cfg = {
                app: me,
                menu: []
            },
            launcher;

        Ext.apply(cfg, me.startConfig);

        Ext.each(me.modules, function (module) {
            launcher = module.launcher;
            if (launcher) {
                launcher.handler = launcher.handler || Ext.bind(me.createWindow, me, [module]);
                cfg.menu.push(module.launcher);
            }
        });

        return Ext.apply(cfg, {
            title: 'Don Griffin',
            iconCls: 'user',
            height: 300,
            toolConfig: {
                width: 100,
                items: [
                    {
                        text:'Settings',
                        iconCls:'settings',
                        handler: me.onSettings,
                        scope: me
                    },
                    '-',
                    {
                        text:'Logout',
                        iconCls:'logout',
                        handler: me.onLogout,
                        scope: me
                    }
                ]
            }
        });
    },

    createWindow: function(module) {
        var window = module.createWindow();
        window.show();
    },

    /**
     * This method returns the configuration object for the TaskBar. A derived class
     * can override this method, call the base version to build the config and then
     * modify the returned object before returning it.
     */
    getTaskbarConfig: function () {
        var me = this, cfg = {
            app: me,
            startConfig: me.getStartConfig()
        };

        Ext.apply(cfg, me.taskbarConfig);
        return Ext.apply(cfg, {
            quickStart: [
                { name: 'Accordion Window', iconCls: 'accordion', module: 'acc-win' },
                { name: 'Grid Window', iconCls: 'icon-grid', module: 'grid-win' }
            ],
            trayItems: [
                { xtype: 'trayclock', flex: 1 }
            ]
        });
    },

    initModules : function(modules) {
        var me = this;
        Ext.each(modules, function (module) {
            module.app = me;
        });
    },

    getModule : function(name) {
    	var ms = this.modules;
        for (var i = 0, len = ms.length; i < len; i++) {
            var m = ms[i];
            if (m.id == name || m.appType == name) {
                return m;
            }
        }
        return null;
    },

    onReady : function(fn, scope) {
        if (this.isReady) {
            fn.call(scope, this);
        } else {
            this.on({
                ready: fn,
                scope: scope,
                single: true
            });
        }
    },

    getDesktop : function() {
        return this.desktop;
    },

    onUnload : function(e) {
        if (this.fireEvent('beforeunload', this) === false) {
            e.stopEvent();
        }
    },
    
    onLogout: function () {
        Ext.Msg.confirm('Logout', 'Are you sure you want to logout?');
    },

    onSettings: function () {
        var dlg = new MyDesktop.Settings({
            desktop: this.desktop
        });
        dlg.show();
    },
    
    getFileChooser: function(animateTarget, selected) {
    	if(null == this.chooser) {
    		this.chooser = Ext.create('meetup.view.FileChooser', {
    	        id: 'img-chooser-dlg',
    	        animateTarget: animateTarget,
    	        listeners: {
    	            selected: selected
    	        }
        	});
    	} else {
    		this.chooser.animateTarget = animateTarget;
    		this.listeners = {selected: selected};
    	}
    	// reload data
    	this.chooser.getStore().reload();
    	return this.chooser;
    }
});