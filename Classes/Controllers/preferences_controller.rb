PREFS_SIZE = [400, 300]

class PreferencesContentViewController < NSViewController

  ### Object Life Cycle
  
  def initWithNibName(nibNameOrNil, bundle:nibBundleOrNil)
    if super
      self.view = NSView.alloc.initWithFrame [49, 21] + PREFS_SIZE
      
      @start_at_login_button = NSButton.alloc.initWithFrame [0, 0, self.view.frame.size.width, self.view.frame.size.height]
      @start_at_login_button.title = NSBundle.localized_string_for_key("DIPreferencesButtonStartAtLogin")
      @start_at_login_button.buttonType = NSSwitchButton
      @start_at_login_button.bezelStyle = NSRegularSquareBezelStyle
      @start_at_login_button.target = self
      @start_at_login_button.action = "start_at_login_button_clicked:"
      
      self.view.addSubview @start_at_login_button
    end
    self
  end
  
  ### Actions
  
  def start_at_login_button_clicked(sender)
    puts "start at login button clicked"
  end

end


class PreferencesController < NSWindowController

  attr_accessor :pref_content_view_controller

  ### Object Life Cycle

  def init
    if super
      self.pref_content_view_controller = PreferencesContentViewController.alloc.initWithNibName nil, bundle:nil
      
      screen_frame = NSScreen.screens[0].visibleFrame
      prefs_width, prefs_height = PREFS_SIZE
      prefs_x = screen_frame.origin.x + (screen_frame.size.width - prefs_width) / 2
      prefs_y = screen_frame.origin.y + (screen_frame.size.height - prefs_height) / 2
      prefs_frame = [prefs_x, prefs_y, prefs_width, prefs_height]
      
      prefs_window = NSWindow.alloc.initWithContentRect prefs_frame,
                                              styleMask:NSTitledWindowMask | NSClosableWindowMask,
                                                backing:NSBackingStoreBuffered,
                                                  defer:true
      prefs_window.showsToolbarButton = false
      prefs_window.title = NSBundle.localized_string_for_key "DIPreferencesTitle"
      
      prefs_window.contentView.addSubview self.pref_content_view_controller.view
      prefs_window.initialFirstResponder = self.pref_content_view_controller.view
      
      self.window = prefs_window
    end
    self
  end

end
