//
//  VerticallyCenteredTextFieldCell.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-01.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


class VerticallyCenteredTextFieldCell: NSTextFieldCell {

	override func titleRect(forBounds theRect: NSRect) -> NSRect {
		var titleFrame = super.titleRect(forBounds: theRect)
		let titleSize = self.attributedStringValue.size
		titleFrame.origin.y = theRect.origin.y - 1.0 + (theRect.size.height - titleSize().height) / 2.0
		return titleFrame
	}
	
	override func drawInterior(withFrame cellFrame: NSRect, in controlView: NSView) {
		let titleRect = self.titleRect(forBounds: cellFrame)
		self.attributedStringValue.draw(in: titleRect)
	}


}
