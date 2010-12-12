# app_delegate.rb
# Ralph
#
# Created by Andrew Sardone on 12/11/10.
# Copyright 2010 __MyCompanyName__. All rights reserved.


class AppDelegate

  attr_accessor :status_item_controller

  def applicationDidFinishLaunching(notification)
    self.status_item_controller = StatusItemController.alloc.init
  end

end
