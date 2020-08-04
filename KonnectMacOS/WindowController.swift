//
//  WindowController.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-02.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


class WindowController: NSWindowController {

	var tabViewController: NSTabViewController?
	
	override func windowDidLoad() {
		super.windowDidLoad()
		
		self.tabViewController = self.window?.contentViewController as? NSTabViewController
	}
	
	@IBAction func clickedMenu(_ sender: Any) {
		let vc = ViewController.shared
		vc?.toggleDrawer()
//		print("clicked Menu")
	}
	
//	@IBAction func segmentedControlSwitched(_ sender: Any) {
//		let segmentedControl = sender as! NSSegmentedControl
//		self.tabViewController?.selectedTabViewItemIndex = segmentedControl.selectedSegment
//	}

}
