//
//  NSView+bringToFront.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-02.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import AppKit


extension NSView {
	
	func bringSubviewToFront(_ view: NSView) {
		var theView = view
		self.sortSubviews({(viewA,viewB,rawPointer) in
			let view = rawPointer?.load(as: NSView.self)
			
			switch view {
			case viewA:
				return ComparisonResult.orderedDescending
			case viewB:
				return ComparisonResult.orderedAscending
			default:
				return ComparisonResult.orderedSame
			}
		}, context: &theView)
	}


}
