# status_item_controller.rb
# Ralph
#
# Created by Andrew Sardone on 12/12/10.
# Copyright 2010 __MyCompanyName__. All rights reserved.


class StatusItemController

  attr_accessor :status_item, :menu
  
  INITIAL_MENU_ITEMS = [
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
  
  ### Object Life Cycle
  
  def init
    if super
      @menu = NSMenu.alloc.initWithTitle "Menu"
      @menu.delegate = self
      
      INITIAL_MENU_ITEMS.each do |item|
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
    NSApplication.sharedApplication.delegate.show_preferences
  end
  
  def quit_item_clicked(sender)
    exit
  end

end
