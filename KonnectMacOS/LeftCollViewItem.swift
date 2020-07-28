//
//  LeftCollViewItem.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-28.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa

class LeftCollViewItem: NSCollectionViewItem {
/*
	@IBOutlet weak var stackVert: NSStackView!
	@IBOutlet weak var stackVertBottom: NSLayoutConstraint!
	@IBOutlet weak var stackVertLeading: NSLayoutConstraint!
	@IBOutlet weak var stackVertTop: NSLayoutConstraint!
	@IBOutlet weak var stackVertTailing: NSLayoutConstraint!
	@IBOutlet weak var stackHorz: NSStackView!
	@IBOutlet weak var stackHorzTrailing: NSLayoutConstraint!
	@IBOutlet weak var stackHorzTop: NSLayoutConstraint!
	@IBOutlet weak var stackHorzLeading: NSLayoutConstraint!
	@IBOutlet weak var textLeft: NSTextField!
	@IBOutlet weak var textLeftWidth: NSLayoutConstraint!
	@IBOutlet weak var textLeftBottom: NSLayoutConstraint!
	@IBOutlet weak var textLeftLeading: NSLayoutConstraint!
	@IBOutlet weak var textLeftTop: NSLayoutConstraint!
	@IBOutlet weak var textMiddle: NSTextField!
	@IBOutlet weak var textBottom: NSLayoutConstraint!
	@IBOutlet weak var textTop: NSLayoutConstraint!
	@IBOutlet weak var textRight: NSTextField!
	@IBOutlet weak var textRightWidth: NSLayoutConstraint!
	@IBOutlet weak var textRightTop: NSLayoutConstraint!
	@IBOutlet weak var textRightTrailing: NSLayoutConstraint!
	@IBOutlet weak var textRightBottom: NSLayoutConstraint!
	@IBOutlet weak var horzLine: NSBox!
	@IBOutlet weak var horzLineHeight: NSLayoutConstraint!
	@IBOutlet weak var horzLineLeading: NSLayoutConstraint!
	@IBOutlet weak var horzLineBottom: NSLayoutConstraint!
	@IBOutlet weak var horzLineTrailing: NSLayoutConstraint!
	*/
	let stackVert: NSStackView = {
		let view = NSStackView()
//		view.alignment = NSLayoutConstraint.Attribute.leading
//		view.distribution = NSStackView.Distribution.fill
		view.orientation = NSUserInterfaceLayoutOrientation.vertical
		view.spacing = 8
		return view
	}()
	var stackVertBottom: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var stackVertLeading: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var stackVertTop: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var stackVertTailing: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var stackHorz: NSStackView = {
		let view = NSStackView()
		view.orientation = NSUserInterfaceLayoutOrientation.horizontal
		view.spacing = 8
		return view
	}()
	var stackHorzTrailing: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var stackHorzTop: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var stackHorzLeading: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var textLeft: NSTextField = {
		let view = NSTextField()
		return view
	}()
	var textLeftWidth: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var textLeftBottom: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var textLeftLeading: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var textLeftTop: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var textMiddle: NSTextField = {
		let view = NSTextField()
		return view
	}()
	var textBottom: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var textTop: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var textRight: NSTextField = {
		let view = NSTextField()
		return view
	}()
	var textRightWidth: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var textRightTop: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var textRightTrailing: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	var textRightBottom: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	let horzLine: NSBox = {
		let view = NSBox()
		return view
	}()
	let horzLineHeight: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	let horzLineLeading: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	let horzLineBottom: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	let horzLineTrailing: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()

	override func loadView() {
		super.loadView()
		self.view = NSView()
		self.view.wantsLayer = true
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		view.wantsLayer = true
    }
	
	func drawInner() {
		
	}
	
	override var isSelected: Bool {
		didSet {
			super.isSelected = isSelected
			view.layer?.backgroundColor = isSelected ? NSColor.selectedControlColor.cgColor : NSColor.clear.cgColor
		}
	}


}
