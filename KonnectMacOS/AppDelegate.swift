//
//  AppDelegate.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-27.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import AppKit


var running = true

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

//	var window: NSWindow!
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		/*
		window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 800, height: 600),
						  styleMask: [NSWindow.StyleMask.closable, NSWindow.StyleMask.titled, NSWindow.StyleMask.resizable, NSWindow.StyleMask.miniaturizable],
						  backing: NSWindow.BackingStoreType.buffered,
						  defer: false)
		window.title = "Konnect - macOS"
//		window.center()
//		window.orderFrontRegardless()
		window.isOpaque = false
		window.isMovableByWindowBackground = true
//		window.backgroundColor = ?
		window.makeKeyAndOrderFront(nil)*/
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
//	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
//		return true
//	}


}
/*
let app = NSApplication.shared
let appDelegate = AppDelegate()
//app.delegate = appDelegate
//app.setActivationPolicy(.regular)
//app.finishLaunching()

let window = NSWindow(contentRect: NSMakeRect(0, 0, 1024, 768),
					  styleMask: [.closable, .titled, .resizable, .miniaturizable],
					  backing: .buffered,
					  defer: true)

let windowDelegate = WindowDelegate()
window.delegate = windowDelegate
window.title = "Hey, Window under control!"
window.acceptsMouseMovedEvents = true
window.center()
window.orderFrontRegardless()

while(running) {
	var ev: NSEvent?
	ev = app.nextEvent(matching: .any, until: nil, inMode: .default, dequeue: true)
	if (ev != nil) {
		NSLog("%@", ev!)
		app.sendEvent(ev!)
	}
}

app.terminate(nil)
*/
