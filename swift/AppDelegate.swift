import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: PIDWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        let pid = getpid()
        window = PIDWindow(pid: pid)
        window?.makeKeyAndOrderFront(nil)

        // Create the main menu
        let mainMenu = NSMenu()

        // Create the app menu item
        let appMenuItem = NSMenuItem()
        mainMenu.addItem(appMenuItem)

        // Create the app menu
        let appMenu = NSMenu()
        let quitTitle = "Quit \(ProcessInfo.processInfo.processName)"
        let quitMenuItem = NSMenuItem(title: quitTitle, action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        appMenu.addItem(quitMenuItem)

        appMenuItem.submenu = appMenu

        // Set the main menu to the app
        NSApplication.shared.mainMenu = mainMenu
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

