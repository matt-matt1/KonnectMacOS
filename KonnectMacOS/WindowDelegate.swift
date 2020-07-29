//
//  WindowDelegate.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-28.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa

class WindowDelegate: NSObject, NSWindowDelegate {

	func windowDidResize(_ notification: Notification) {
		NSLog("windowDidResize")
	}
	
	func windowWillClose(_ notification: Notification) {
		NSLog("windowWillClose")
		running = false
	}


}
