//
//  LeftItem.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-28.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


class LeftItem {

	let title: String
	let left: String
	let right: String
	
	
	init(title: String, left: String="", right: String="") {
		self.title = title
		self.left = left
		self.right = right
	}


}
