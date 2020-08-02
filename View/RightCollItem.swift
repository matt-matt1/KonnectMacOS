//
//  RightCollItem.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-28.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa

final class RightCollItem: NSCollectionViewItem {
	
	let stackVert: NSStackView = {
		let view = NSStackView()
		view.alignment = NSLayoutConstraint.Attribute.leading
		view.distribution = NSStackView.Distribution.fill
		view.orientation = NSUserInterfaceLayoutOrientation.vertical
		view.spacing = 0
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var stackVertInset = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	var imageMain: NSImageView = {
		let view = NSImageView()
		return view
	}()
	var imageMainInset = NSEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
	var textLabel: NSTextField = {
		let view = NSTextField()
		view.alignment = NSTextAlignment.center
		return view
	}()
	var textLabelInset = NSEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
	let textLabelHeight: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		view.constant = 50
		return view
	}()
//	var imageMainLeading: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var imageMainTrailing: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var imageMainTop: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var textLabelBottom: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var textLabelLeading: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var textLabelTrailing: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var stackVertLeading: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var stackVertTrailing: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var stackVertTop: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
//	var stackVertBottom: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		return view
//	}()
	static let id = NSUserInterfaceItemIdentifier(rawValue: "RightCollViewCellID")

	override var isSelected: Bool {
		didSet {
			super.isSelected = isSelected
			view.layer?.backgroundColor = isSelected ? NSColor.selectedControlColor.cgColor : NSColor.clear.cgColor
		}
	}

	
	override func loadView() {
		self.view = NSView()
		self.view.wantsLayer = true
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		drawInner()
    }
	
	
	func drawInner() {
		self.view.addSubview(stackVert)
		stackVert.addArrangedSubview(imageMain)
		stackVert.addArrangedSubview(textLabel)
//		stackHorz.addArrangedSubview(textLeft)
//		stackHorz.addArrangedSubview(textMiddle)
//		stackHorz.addArrangedSubview(textRight)
		NSLayoutConstraint.activate([
			stackVert.topAnchor.constraint(equalTo: self.view.topAnchor, constant: stackVertInset.top),
			stackVert.leadingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: stackVertInset.left),
			stackVert.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -stackVertInset.bottom),
			stackVert.trailingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -stackVertInset.right),
			
			imageMain.topAnchor.constraint(equalTo: stackVert.topAnchor, constant: imageMainInset.top),
			imageMain.leadingAnchor.constraint(equalTo: stackVert.leadingAnchor, constant: imageMainInset.left),
			imageMain.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -imageMainInset.bottom),
			imageMain.trailingAnchor.constraint(equalTo: stackVert.trailingAnchor, constant: -imageMainInset.right),
			
			textLabel.heightAnchor.constraint(equalToConstant: textLabelHeight.constant),
			textLabel.leadingAnchor.constraint(equalTo: stackVert.leadingAnchor, constant: textLabelInset.left),
			textLabel.bottomAnchor.constraint(equalTo: stackVert.bottomAnchor, constant: -textLabelInset.bottom),
			textLabel.trailingAnchor.constraint(equalTo: stackVert.trailingAnchor, constant: -textLabelInset.right),
/*
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
*/
			])
	}


}
