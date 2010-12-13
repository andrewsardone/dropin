class NSBundle

  def self.localized_string_for_key(key, comment = '')
    NSBundle.mainBundle.localizedStringForKey(key, value:comment, table:nil)
  end

end
