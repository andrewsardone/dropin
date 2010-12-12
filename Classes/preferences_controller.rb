# preferences_controller.rb
# Ralph
#
# Created by Andrew Sardone on 12/12/10.
# Copyright 2010 __MyCompanyName__. All rights reserved.


class PreferencesController < NSWindowController

  def self.preferences_controller
    screen_frame = NSScreen.screens[0].visibleFrame
    panel_width, panel_height = [400, 300]
    panel_x = screen_frame.origin.x + (screen_frame.size.width - panel_width)/2
    panel_y = screen_frame.origin.y + (screen_frame.size.height - panel_height)/2
    
    panel = NSPanel.alloc.initWithContentRect [panel_x, panel_y, panel_width, panel_height],
                                    styleMask: NSTitledWindowMask | NSClosableWindowMask,
                                      backing: NSBackingStoreBuffered,
                                        defer: false
    panel.title = "Preferences"
    PreferencesController.alloc.initWithWindow panel
  end

end
