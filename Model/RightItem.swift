//
//  RightItem.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-28.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


class RightItem {
	let section: String
	let items: [RightSubItem]

	
	init(section: String, items: [RightSubItem]) {
		self.section = section
		self.items = items
	}


}


class RightSubItem {
	let image: NSImage?
	let title: String
	let left: String
	let right: String
	
	
	init(image: NSImage?, title: String, left: String="", right: String="") {
		self.image = image
		self.title = title
		self.left = left
		self.right = right
	}
	
	
}
