class StatusItemView < NSView

  ### Object Life Cycle

  def initWithFrame(frame)
    if super
        self.registerForDraggedTypes [ NSFilenamesPboardType ]
    end
    self
  end
  
  ### NSDraggingDestination methods
  
  def draggingEntered(sender)
    sourceDragMask = sender.draggingSourceOperationMask
    pboard = sender.draggingPasteboard
    
    if pboard.types.include? NSFilenamesPboardType
      return NSDragOperationCopy if sourceDragMask & NSDragOperationCopy
    end
    
    return NSDragOperationNone
  end

end
