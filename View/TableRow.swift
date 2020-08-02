//
//  TableRow.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-01.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


class TableRow: NSView {

	var left: String = "L" {
		didSet {
			viewLeft.stringValue = left
		}
	}
	var center: String = "center" {
		didSet {
			viewCenter.stringValue = center
		}
	}
	var right: String = "R" {
		didSet {
			viewRight.stringValue = right
		}
	}
	var farRight: String = "R" {
		didSet {
			viewFarRight.stringValue = farRight
		}
	}
	var inset = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	var gapLeftCenter: CGFloat = 1
	var gapCenterRight: CGFloat = 1
	private let viewLeft: NSTextField = {
		let cell = VerticallyCenteredTextFieldCell()
		let view = NSTextField()
		view.cell = cell
		view.isBezeled = false
		view.isBordered = false
		view.isEditable = false
		view.isSelectable = true
		view.drawsBackground = false
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let viewCenter: NSTextField = {
		let cell = VerticallyCenteredTextFieldCell()
		let view = NSTextField()
		view.cell = cell
		view.isBezeled = false
		view.isBordered = false
		view.isEditable = false
//		view.textColor = NSColor.white
		view.isSelectable = true
		view.drawsBackground = false
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let viewRight: NSTextField = {
		let cell = VerticallyCenteredTextFieldCell()
		let view = NSTextField()
		view.cell = cell
		view.isBezeled = false
		view.isBordered = false
		view.isEditable = false
		view.isSelectable = true
		view.drawsBackground = false
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let viewFarRight: NSTextField = {
		let cell = VerticallyCenteredTextFieldCell()
		let view = NSTextField()
		view.cell = cell
		view.isBezeled = false
		view.isBordered = false
		view.isEditable = false
		view.isSelectable = true
		view.drawsBackground = false
		view.alignment = NSTextAlignment.right
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
//	/*private*/ var highlighted = false {
//		didSet {
//			viewLeft.backgroundColor = self.highlighted ? NSColor.selectedControlColor : NSColor.clear
//			viewCenter.backgroundColor = self.highlighted ? NSColor.selectedControlColor : NSColor.clear
//			viewRight.backgroundColor = self.highlighted ? NSColor.selectedControlColor : NSColor.clear
//			viewLeft.textColor = self.highlighted ? NSColor.white : NSColor.darkGray
//			viewCenter.textColor = self.highlighted ? NSColor.white : NSColor.darkGray
//			viewRight.textColor = self.highlighted ? NSColor.white : NSColor.darkGray
//		}
//	}

	
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        addSubview(viewLeft)
		addSubview(viewCenter)
		addSubview(viewRight)
		addSubview(viewFarRight)
		NSLayoutConstraint.activate([
			viewLeft.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
			viewLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset.left),
			viewLeft.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
			
			viewCenter.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
			viewCenter.leadingAnchor.constraint(equalTo: viewLeft.trailingAnchor, constant: gapLeftCenter),
			viewCenter.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
			viewCenter.trailingAnchor.constraint(equalTo: viewRight.leadingAnchor, constant: -gapCenterRight),
			
			viewRight.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
			viewRight.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset.right),
			viewRight.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),

			viewFarRight.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
			viewFarRight.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset.right),
			viewFarRight.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
			])
//		viewLeft.backgroundColor = self.highlighted ? NSColor.selectedControlColor : NSColor.clear
//		viewCenter.backgroundColor = self.highlighted ? NSColor.selectedControlColor : NSColor.clear
//		viewRight.backgroundColor = self.highlighted ? NSColor.selectedControlColor : NSColor.clear
//		viewLeft.textColor = self.highlighted ? NSColor.white : NSColor.darkGray
//		viewCenter.textColor = self.highlighted ? NSColor.white : NSColor.darkGray
//		viewRight.textColor = self.highlighted ? NSColor.white : NSColor.darkGray
    }


}
