# NSBundle_ext.rb
# DropIn
#
# Created by Andrew Sardone on 12/12/10.
# Copyright 2010 __MyCompanyName__. All rights reserved.


class NSBundle

  def self.localized_string_for_key(key, comment = '')
    NSBundle.mainBundle.localizedStringForKey(key, value:comment, table:nil)
  end

end
