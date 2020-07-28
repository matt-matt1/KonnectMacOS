//
//  RightCollItem.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-28.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa

class RightCollItem: NSCollectionViewItem {

	@IBOutlet weak var stackVert: NSStackView!
	@IBOutlet weak var imageMain: NSImageView!
	@IBOutlet weak var textLabel: NSTextField!
	@IBOutlet weak var textLabelHeight: NSLayoutConstraint!
	@IBOutlet weak var imageMainLeading: NSLayoutConstraint!
	@IBOutlet weak var imageMainTrailing: NSLayoutConstraint!
	@IBOutlet weak var imageMainTop: NSLayoutConstraint!
	@IBOutlet weak var textLabelBottom: NSLayoutConstraint!
	@IBOutlet weak var textLabelLeading: NSLayoutConstraint!
	@IBOutlet weak var textLabelTrailing: NSLayoutConstraint!
	@IBOutlet weak var stackVertLeading: NSLayoutConstraint!
	@IBOutlet weak var stackVertTrailing: NSLayoutConstraint!
	@IBOutlet weak var stackVertTop: NSLayoutConstraint!
	@IBOutlet weak var stackVertBottom: NSLayoutConstraint!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.wantsLayer = true
    }

	override var isSelected: Bool {
		didSet {
			super.isSelected = isSelected
			view.layer?.backgroundColor = isSelected ? NSColor.selectedControlColor.cgColor : NSColor.clear.cgColor
		}
	}


}
