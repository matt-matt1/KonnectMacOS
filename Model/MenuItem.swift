//
//  MenuItem.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-03.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import AppKit


class MenuItem {
	
	let left: NSAttributedString?
	let leftImg: NSImage?
	let right: NSAttributedString?
	let rightImg: NSImage?
	let title: NSAttributedString
	let far: NSAttributedString?
	let farImg: NSImage?
	let isGroup: Bool
	var margin = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	var gapLeftTitle: CGFloat = 0
	var gapTitleRight: CGFloat = 0

	
	init(left: NSAttributedString? = NSAttributedString(string: ""),
		 leftImg: NSImage? = nil,
		 right: NSAttributedString? = NSAttributedString(string: ""),
		 rightImg: NSImage? = nil,
		 title: NSAttributedString,
		 far: NSAttributedString? = NSAttributedString(string: ""),
		 farImg: NSImage? = nil,
		 isGroup: Bool = false) {
		self.left = left
		self.leftImg = leftImg
		self.right = right
		self.rightImg = rightImg
		self.title = title
		self.far = far
		self.farImg = farImg
		self.isGroup = isGroup
	}


}
