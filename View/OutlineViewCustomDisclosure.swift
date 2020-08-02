//
//  SidebarView.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-01.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


class OutlineViewCustomDisclosure: NSOutlineView {

	override func makeView(withIdentifier identifier: NSUserInterfaceItemIdentifier, owner: Any?) -> NSView? {
		let view = super.makeView(withIdentifier: identifier, owner: owner)
		
		if identifier == NSOutlineView.disclosureButtonIdentifier {
			if let btnView = view as? NSButton {
				btnView.image = NSImage(named: "RightArrow")
				btnView.alternateImage = NSImage(named: "DownArrow")
				
				// can set properties of the image like the size
				btnView.image?.size = NSSize(width: 15.0, height: 15.0)
				btnView.alternateImage?.size = NSSize(width: 15.0, height: 15.0)
			}
		}
		return view
	}
    

}
