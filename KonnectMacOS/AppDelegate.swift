//
//  AppDelegate.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-27.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import AppKit
import AwesomeEnum


var running = true

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate/*, NSToolbarDelegate*/ {

//	var window: NSWindow!
/*	var toolbar: NSToolbar!
	let toolbarItems: [[String: String]] = [
		["title": "irrelevant :)", 	"icon": "", "identifier": "NavigationGroupToolbarItem"],
		["title": "Share", 			"icon": NSImage.shareTemplateName, "identifier": "ShareToolbarItem"],
		["title": "Add", 			"icon": NSImage.addTemplateName, "identifier": "AddToolbarItem"]
	]
	var toolbarTabsIdentifiers: [NSToolbarItem.Identifier] {
		return toolbarItems
			.compactMap { $0["identifier"] }
			.map{ NSToolbarItem.Identifier(rawValue: $0) }
	}*/
	
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		AwesomePro.loadFonts(from: Bundle.main)
/*		toolbar = NSToolbar(identifier: NSToolbar.Identifier("TheToolbarIdentifier"))
		toolbar.allowsUserCustomization = true
		toolbar.delegate = self
		self.window?.toolbar = toolbar*/
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
	/*
	func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
		
		guard let infoDictionary: [String : String] = toolbarItems.filter({ $0["identifier"] == itemIdentifier.rawValue }).first
			else { return nil }
		
		let toolbarItem: NSToolbarItem
		
		if itemIdentifier.rawValue == "NavigationGroupToolbarItem" {
			
			let group = NSToolbarItemGroup(itemIdentifier: itemIdentifier)
			
			let itemA = NSToolbarItem(itemIdentifier: NSToolbarItem.Identifier(rawValue: "PrevToolbarItem"))
			itemA.label = "Prev"
			let itemB = NSToolbarItem(itemIdentifier: NSToolbarItem.Identifier(rawValue: "NextToolbarItem"))
			itemB.label = "Next"
			
			let segmented = NSSegmentedControl(frame: NSRect(x: 0, y: 0, width: 85, height: 40))
			segmented.segmentStyle = .texturedRounded
			segmented.trackingMode = .momentary
			segmented.segmentCount = 2
			// Don't set a label: these would appear inside the button
			segmented.setImage(NSImage(named: NSImage.goLeftTemplateName), forSegment: 0)
			segmented.setWidth(40, forSegment: 0)
			segmented.setImage(NSImage(named: NSImage.goRightTemplateName), forSegment: 1)
			segmented.setWidth(40, forSegment: 1)
			
			// `group.label` would overwrite segment labels
			group.paletteLabel = "Navigation"
			group.subitems = [itemA, itemB]
			group.view = segmented
			
			toolbarItem = group
		} else {
			toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier)
			toolbarItem.label = infoDictionary["title"]!
			
			let iconImage = NSImage(named: NSImage.Name(infoDictionary["icon"]!))
			let button = NSButton(frame: NSRect(x: 0, y: 0, width: 40, height: 40))
			button.title = ""
			button.image = iconImage
			button.bezelStyle = .texturedRounded
			toolbarItem.view = button
		}
		
		return toolbarItem
	}
	
	func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return self.toolbarTabsIdentifiers;
	}
	
	func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return self.toolbarDefaultItemIdentifiers(toolbar)
	}
	
	func toolbarSelectableItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return self.toolbarDefaultItemIdentifiers(toolbar)
	}
	
	func toolbarWillAddItem(_ notification: Notification) {
		print("toolbarWillAddItem", (notification.userInfo?["item"] as? NSToolbarItem)?.itemIdentifier ?? "")
	}
	
	func toolbarDidRemoveItem(_ notification: Notification) {
		print("toolbarDidRemoveItem", (notification.userInfo?["item"] as? NSToolbarItem)?.itemIdentifier ?? "")
	}
*/

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

