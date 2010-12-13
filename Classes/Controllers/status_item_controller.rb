class StatusItemController

  attr_accessor :status_item, :menu
  
  ### Object Life Cycle
  
  def init
    if super
      @menu = NSMenu.alloc.initWithTitle "Menu"
      @menu.delegate = self
      
      initial_menu_items.each do |item|
        item.target = self
        @menu.addItem item
      end

      @status_item = NSStatusBar.systemStatusBar.statusItemWithLength NSVariableStatusItemLength
      @status_item.menu = @menu
      @status_item.title = "Ralph"
      @status_item.highlightMode = true
    end
    self
  end
  
  ### Actions
  
  def pref_item_clicked(sender)
    NSApplication.sharedApplication.delegate.show_preferences sender
  end
  
  def quit_item_clicked(sender)
    exit
  end
  
  private
  
  def initial_menu_items
    unless @imt
      @imt = [
        NSMenuItem.alloc.initWithTitle(NSBundle.localized_string_for_key("DIMenuItemTitleHistory"), 
                                action:nil, 
                         keyEquivalent:""),
        NSMenuItem.separatorItem,
        NSMenuItem.alloc.initWithTitle(NSBundle.localized_string_for_key("DIMenuItemTitlePreferences"), 
                                action:"pref_item_clicked:", 
                         keyEquivalent:""),
        NSMenuItem.alloc.initWithTitle(NSBundle.localized_string_for_key("DIMenuItemTitleQuit"), 
                                action:"quit_item_clicked:", 
                         keyEquivalent:"")
      ]
    end
    @imt
  end

end
