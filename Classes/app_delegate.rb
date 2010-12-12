# app_delegate.rb
# Ralph
#
# Created by Andrew Sardone on 12/11/10.
# Copyright 2010 __MyCompanyName__. All rights reserved.


class AppDelegate

  attr_accessor :status_item_controller, :preferences_controller

  def applicationDidFinishLaunching(notification)
    self.status_item_controller = StatusItemController.alloc.init
  end
  
  def show_preferences
    unless self.preferences_controller
      self.preferences_controller = PreferencesController.preferences_controller
    end
    self.preferences_controller.showWindow self
  end

end
