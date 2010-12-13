class AppDelegate

  attr_accessor :status_item_controller, :preferences_controller

  def applicationDidFinishLaunching(notification)
    self.status_item_controller = StatusItemController.alloc.init
  end
  
  ### Preferences
  
  def show_preferences(sender)
    NSApplication.sharedApplication.activateIgnoringOtherApps(true)
    self.preferences_controller.showWindow sender
  end
  
  ### Property Overrides
  
  def preferences_controller
    unless @preferences_controller
      @preferences_controller = PreferencesController.alloc.init
    end
    @preferences_controller
  end

end
