import Foundation
import AppKit

class PIDWindow: NSWindow {
    var pidLabel: NSTextField

    init(pid: Int32) {
        pidLabel = NSTextField(frame: NSRect(x: 20, y: 40, width: 260, height: 20))
        pidLabel.stringValue = "Child Process PID: \(pid)"
        pidLabel.isEditable = false
        pidLabel.isBordered = false
        pidLabel.drawsBackground = false

        let contentRect = NSRect(x: 100, y: 100, width: 300, height: 100)
        super.init(contentRect: contentRect,
                   styleMask: [.titled, .closable, .miniaturizable, .resizable],
                   backing: .buffered,
                   defer: false)

        
        self.title = "PID Display"
        self.isReleasedWhenClosed = false
        self.contentView?.addSubview(pidLabel)
    }
}

