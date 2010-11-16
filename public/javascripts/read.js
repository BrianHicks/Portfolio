Ext.setup({
    tabletStartupScreen: '/images/tablet_startup.png',
    phoneStartupScreen: '/images/phone_startup.png',
    icon: '/images/icon.png',
    glossOnIcon: false,
    onReady: function() {
        // Apply special styles for iPhones and iPods
        if (Ext.is.iPod || Ext.is.iPhone || Ext.is.Android) {
          Ext.select('body').addCls("smallscreen");
        }
        
        // Get entries
        var entries = Ext.select('.entry'),
            cards = [];
            
        entries.each(function() {
          var card = {
            xtype: 'component',
            contentEl: this.dom
          }
          if (this.hasCls("static") == false) {
            card['scroll'] = 'vertical'
          }
          cards.push(card);
        });
    
        // Create a Carousel of Items
        var carousel1 = new Ext.Carousel({
            defaults: {
                cls: 'card'
            },
            items: cards
        });

        new Ext.Panel({
            fullscreen: true,
            layout: {
                type: 'vbox',
                align: 'stretch'
            },
            defaults: {
                flex: 1
            },
            items: [carousel1]
        });
    }
});
