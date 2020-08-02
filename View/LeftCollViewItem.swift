//
//  LeftCollViewItem.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-28.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa

final class LeftCollViewItem: NSCollectionViewItem {

	let stackVert: NSStackView = {
		let view = NSStackView()
//		view.alignment = NSLayoutConstraint.Attribute.leading
//		view.distribution = NSStackView.Distribution.fill
		view.orientation = NSUserInterfaceLayoutOrientation.vertical
		view.spacing = 8
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var stackVertInset = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//	var stackVertBottom: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var stackVertLeading: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var stackVertTop: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var stackVertTailing: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
	var stackHorz: NSStackView = {
		let view = NSStackView()
		view.orientation = NSUserInterfaceLayoutOrientation.horizontal
		view.spacing = 8
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var stackHorzInset = NSEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
//	var stackHorzTrailing: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var stackHorzTop: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var stackHorzLeading: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
	var textLeft: NSTextField = {
		let view = NSTextField()
		view.isBezeled = false
		view.drawsBackground = false
		view.isEditable = false
		view.isSelectable = false
		view.stringValue = "textLeft"
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var textLeftInset = NSEdgeInsets(top: 2, left: 0, bottom: 1, right: 5)
	var textLeftWidth: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
//	var textLeftBottom: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var textLeftLeading: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var textLeftTop: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
	var textMiddle: NSTextField = {
		let view = NSTextField()
		view.isBezeled = false
		view.drawsBackground = false
		view.isEditable = false
		view.isSelectable = false
		view.stringValue = "textMiddle"
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var textMiddleInset = NSEdgeInsets(top: 2, left: 2, bottom: 1, right: 2)
//	var textBottom: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var textTop: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
	var textRight: NSTextField = {
		let view = NSTextField()
		view.isBezeled = false
		view.drawsBackground = false
		view.isEditable = false
		view.isSelectable = false
		view.stringValue = "textRight"
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var textRightInset = NSEdgeInsets(top: 2, left: 5, bottom: 1, right: 0)
	var textRightWidth: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
//	var textRightTop: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var textRightTrailing: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var textRightBottom: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
	let horzLine: NSBox = {
		let view = NSBox()
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.lightGray.cgColor
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let horzLineHeight: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		view.constant = 1
		return view
	}()
	let horzLineLeading: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		view.constant = 7
		return view
	}()
	let horzLineBottom: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		view.constant = 1
		return view
	}()
	let horzLineTrailing: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		view.constant = 7
		return view
	}()
	static let id = NSUserInterfaceItemIdentifier(rawValue: "LeftCollViewCellID")
	
	override var isSelected: Bool {
		didSet {
			super.isSelected = isSelected
			view.layer?.backgroundColor = isSelected ? NSColor.selectedControlColor.cgColor : NSColor.clear.cgColor
		}
	}

	
	override func loadView() {	// in place of nib
//		super.loadView()
		self.view = NSView()
		self.view.wantsLayer = true
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.view.addSubview(stackVert)
		drawInner()
    }
	
	func drawInner() {
//		self.view.addSubview(stackVert)
		stackVert.addSubview(stackHorz)
		stackVert.addSubview(horzLine)
		stackHorz.addArrangedSubview(textLeft)
		stackHorz.addArrangedSubview(textMiddle)
		stackHorz.addArrangedSubview(textRight)
		NSLayoutConstraint.activate([
			stackVert.topAnchor.constraint(equalTo: self.view.topAnchor, constant: stackVertInset.top),
			stackVert.leadingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: stackVertInset.left),
			stackVert.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -stackVertInset.bottom),
			stackVert.trailingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -stackVertInset.right),
			
			stackHorz.topAnchor.constraint(equalTo: stackVert.topAnchor, constant: stackHorzInset.top),
			stackHorz.leadingAnchor.constraint(equalTo: stackVert.leadingAnchor, constant: stackHorzInset.left),
			stackHorz.bottomAnchor.constraint(equalTo: horzLine.topAnchor, constant: -stackHorzInset.bottom),
			stackHorz.trailingAnchor.constraint(equalTo: stackVert.trailingAnchor, constant: -stackHorzInset.right),
			
			horzLine.heightAnchor.constraint(equalToConstant: horzLineHeight.constant),
			horzLine.leadingAnchor.constraint(equalTo: stackVert.leadingAnchor, constant: horzLineLeading.constant),
			horzLine.bottomAnchor.constraint(equalTo: stackVert.bottomAnchor, constant: -horzLineBottom.constant),
			horzLine.trailingAnchor.constraint(equalTo: stackVert.trailingAnchor, constant: -horzLineTrailing.constant),
			
			textLeft.topAnchor.constraint(equalTo: stackHorz.topAnchor, constant: textLeftInset.top),
			textLeft.leadingAnchor.constraint(equalTo: stackHorz.leadingAnchor, constant: textLeftInset.left),
			textLeft.bottomAnchor.constraint(equalTo: stackHorz.bottomAnchor, constant: -textLeftInset.bottom),
//			textLeft.widthAnchor.constraint(equalToConstant: textLeftWidth.constant),

			textMiddle.topAnchor.constraint(equalTo: stackHorz.topAnchor, constant: textMiddleInset.top),
//			textMiddle.leadingAnchor.constraint(equalTo: textLeft.trailingAnchor, constant: 0),
			textMiddle.bottomAnchor.constraint(equalTo: stackHorz.bottomAnchor, constant: -textMiddleInset.bottom),
//			textMiddle.trailingAnchor.constraint(equalTo: textRight.leadingAnchor, constant: 0),

			textRight.topAnchor.constraint(equalTo: stackHorz.topAnchor, constant: textRightInset.top),
//			textRight.widthAnchor.constraint(equalToConstant: textRightWidth.constant),
			textRight.bottomAnchor.constraint(equalTo: stackHorz.bottomAnchor, constant: -textRightInset.bottom),
			textRight.trailingAnchor.constraint(equalTo: stackHorz.trailingAnchor, constant: -textRightInset.right),
			])
	}


}
