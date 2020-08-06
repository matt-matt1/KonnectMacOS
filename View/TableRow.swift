//
//  TableRow.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-01.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


class TableRow: /*NSView*/NSTableCellView {

	var left: String = "L" //{
//		didSet {
//			viewLeft.stringValue = left
//		}
//	}
	var center: String = "center" //{
//		didSet {
//			viewCenter.stringValue = center
//		}
//	}
	var right: String = "R" //{
//		didSet {
//			viewRight.stringValue = right
//		}
//	}
	var farRight: String = "R" //{
//		didSet {
//			viewFarRight.stringValue = farRight
//		}
//	}
	var inset = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	var gapLeftCenter: CGFloat = 1
	var gapCenterRight: CGFloat = 1
	private let viewLeft: NSTextField = {
//		let cell = VerticallyCenteredTextFieldCell()
		let view = NSTextField()
//		view.cell = cell
		view.isBezeled = false
		view.isBordered = false
		view.isEditable = false
		view.isSelectable = true
		view.drawsBackground = false
		view.alignment = NSTextAlignment.left
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let viewCenter: NSTextField = {
//		let cell = VerticallyCenteredTextFieldCell()
		let view = NSTextField()
//		view.cell = cell
		view.isBezeled = false
		view.isBordered = false
		view.isEditable = false
//		view.textColor = NSColor.white
		view.isSelectable = true
		view.drawsBackground = false
		view.alignment = NSTextAlignment.left
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let viewRight: NSTextField = {
//		let cell = VerticallyCenteredTextFieldCell()
		let view = NSTextField()
//		view.cell = cell
		view.isBezeled = false
		view.isBordered = false
		view.isEditable = false
		view.isSelectable = true
		view.drawsBackground = false
		view.alignment = NSTextAlignment.left
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let viewFarRight: NSTextField = {
//		let cell = VerticallyCenteredTextFieldCell()
		let view = NSTextField()
//		view.cell = cell
		view.isBezeled = false
		view.isBordered = false
		view.isEditable = false
		view.isSelectable = true
		view.drawsBackground = false
		view.alignment = NSTextAlignment.right
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let imageLeft: NSImageView = {
		let view = NSImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let imageRight: NSImageView = {
		let view = NSImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let imageFar: NSImageView = {
		let view = NSImageView()
		view.alignment = NSTextAlignment.right
//		view.imageAlignment = NSImageAlignment.alignRight
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
	let stackHorz: NSStackView = {
		let view = NSStackView()
		view.orientation = NSUserInterfaceLayoutOrientation.horizontal
		view.spacing = 10
//		view.distribution = NSStackView.Distribution.fill
//		view.alignment = NSLayoutConstraint.Attribute.centerY
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let leftContainer: NSView = {
		let view = NSView()
//		view.wantsLayer = true
//		view.layer?.backgroundColor = NSColor.green.cgColor
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let centerContainer: NSView = {
		let view = NSView()
//		view.wantsLayer = true
//		view.layer?.backgroundColor = NSColor.red.cgColor
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	private let rightContainer: NSView = {
		let view = NSView()
//		view.wantsLayer = true
//		view.layer?.backgroundColor = NSColor.brown.cgColor
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let stackCenter: NSStackView = {
		let view = NSStackView()
		view.orientation = NSUserInterfaceLayoutOrientation.horizontal
		view.spacing = 10
		//		view.distribution = NSStackView.Distribution.fill
//				view.alignment = NSLayoutConstraint.Attribute.centerY
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

		makeView()
	}
	
	func makeView() {
		addSubview(stackHorz)
		stackHorz.addArrangedSubview(leftContainer)
		if imageLeft.image != nil {
			leftContainer.addSubview(imageLeft)
			imageLeft.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor).isActive = true
			imageLeft.centerYAnchor.constraint(equalTo: leftContainer.centerYAnchor).isActive = true
		}
		stackHorz.addArrangedSubview(centerContainer)
		centerContainer.addSubview(stackCenter)
		stackCenter.addArrangedSubview(viewCenter)
		if imageRight.image != nil {
			stackCenter.addArrangedSubview(imageRight)
		}
		stackHorz.addArrangedSubview(rightContainer)
		if !viewFarRight.stringValue.isEmpty {
			rightContainer.addSubview(viewFarRight)
		}
		if imageFar.image != nil {
			rightContainer.addSubview(imageFar)
			imageFar.centerYAnchor.constraint(equalTo: rightContainer.centerYAnchor).isActive = true
		}
		NSLayoutConstraint.activate([
			stackHorz.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
			stackHorz.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: gapLeftCenter),
			stackHorz.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
			stackHorz.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -gapCenterRight),

			leftContainer.leadingAnchor.constraint(equalTo: stackHorz.leadingAnchor, constant: 0),
			leftContainer.widthAnchor.constraint(equalToConstant: ViewController.iconSize.width + gapLeftCenter),
			
			stackCenter.centerYAnchor.constraint(equalTo: centerContainer.centerYAnchor),

			rightContainer.trailingAnchor.constraint(equalTo: stackHorz.trailingAnchor, constant: 0),
			rightContainer.widthAnchor.constraint(equalToConstant: ViewController.iconSize.width + gapCenterRight),
			])
/*
		NSLayoutConstraint.activate([
		viewLeft.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
		viewLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset.left),
		viewLeft.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
		
		imageLeft.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
		imageLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset.left),
		imageLeft.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
		
		viewCenter.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
		//			viewCenter.leadingAnchor.constraint(equalTo: viewLeft.trailingAnchor, constant: gapLeftCenter),
		/*			viewCenter.leadingAnchor.constraint(greaterThanOrEqualTo: viewLeft.trailingAnchor, constant: gapLeftCenter),*/
		//			viewCenter.leadingAnchor.constraint(equalTo: imageLeft.trailingAnchor, constant: gapLeftCenter),
		viewCenter.leadingAnchor.constraint(equalTo: imageLeft.trailingAnchor, constant: gapLeftCenter),
		viewCenter.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
		//			viewCenter.trailingAnchor.constraint(equalTo: viewRight.leadingAnchor, constant: -gapCenterRight),
		/*			viewCenter.trailingAnchor.constraint(lessThanOrEqualTo: viewRight.leadingAnchor, constant: -gapCenterRight),*/
		//			viewCenter.trailingAnchor.constraint(equalTo: imageRight.leadingAnchor, constant: -gapCenterRight),
		viewCenter.trailingAnchor.constraint(equalTo: imageRight.leadingAnchor, constant: -gapCenterRight),
		
		viewRight.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
		viewRight.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset.right),
		viewRight.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
		
		imageRight.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
		imageRight.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset.right),
		imageRight.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
		
		viewFarRight.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
		viewFarRight.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset.right),
		viewFarRight.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
		
		imageFar.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top),
		imageFar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset.right),
		imageFar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom),
		])

		*/
//		viewLeft.backgroundColor = self.highlighted ? NSColor.selectedControlColor : NSColor.clear
//		viewCenter.backgroundColor = self.highlighted ? NSColor.selectedControlColor : NSColor.clear
//		viewRight.backgroundColor = self.highlighted ? NSColor.selectedControlColor : NSColor.clear
//		viewLeft.textColor = self.highlighted ? NSColor.white : NSColor.darkGray
//		viewCenter.textColor = self.highlighted ? NSColor.white : NSColor.darkGray
//		viewRight.textColor = self.highlighted ? NSColor.white : NSColor.darkGray
    }
	
	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
		
		self.autoresizingMask = .width
/*		let iv: NSImageView = NSImageView(frame: NSMakeRect(0, 6, 16, 16))
		let tf: NSTextField = NSTextField(frame: NSMakeRect(21, 6, 200, 14))
		let btn: NSButton = NSButton(frame: NSMakeRect(0, 3, 16, 16))
		iv.imageScaling = .scaleProportionallyUpOrDown
		iv.imageAlignment = .alignCenter
		tf.isBordered = false
		tf.drawsBackground = false
		btn.cell?.controlSize = .small
		// btn.bezelStyle = .inline                  // Deprecated?
		btn.cell?.isBezeled = true                   // Closest property I can find.
		// btn.cell?.setButtonType(.momentaryPushIn) // Deprecated?
		btn.setButtonType(.momentaryPushIn)
		btn.cell?.font = NSFont.boldSystemFont(ofSize: 10)
		btn.cell?.alignment = .center
		
		self.imageView = iv
		self.textField = tf
		self.addSubview(iv)
		self.addSubview(tf)
		self.addSubview(btn)*/
//		makeView()
	}
	
	required init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setItem(item: MenuItem) {
		if let left = item.left {
			viewLeft.attributedStringValue = left
		}
		if let left = item.leftImg {
			imageLeft.image = left
		}
		if let right = item.right {
			viewLeft.attributedStringValue = right
		}
		if let right = item.rightImg {
			imageRight.image = right
		}
		if let far = item.far {
			viewLeft.attributedStringValue = far
		}
		if let far = item.farImg {
			imageFar.image = far
		}
		viewCenter.attributedStringValue = item.title
//		left = item.left ?? "L"
//		right = item.right ?? "R"
//		farRight = item.far ?? "OK"
//		center = item.title
		if item.gapTitleRight > 0 {
			gapCenterRight = item.gapTitleRight
		} else if !right.isEmpty {
			gapCenterRight = 20
		}
		if item.gapLeftTitle > 0 {
			gapLeftCenter = item.gapLeftTitle
		} else if !left.isEmpty {
			gapLeftCenter = 5
		}
		if item.margin.top > 0 || item.margin.left > 0 || item.margin.bottom > 0 || item.margin.right > 0 {
			inset = item.margin
		} else {
			inset = NSEdgeInsets(top: 0, left: 10, bottom: 0, right: 15)
		}
		if item.isGroup {
			let temp = NSMutableAttributedString(attributedString: item.title)
			temp.addAttribute(NSAttributedString.Key.font, value: NSFont.boldSystemFont(ofSize: NSFont.systemFontSize), range: NSMakeRange(0, item.title.length))
			viewLeft.attributedStringValue = temp
//			viewCenter.attributedStringValue = NSAttributedString(string: item.title.uppercased(), attributes: [NSAttributedString.Key.font : NSFont.boldSystemFont(ofSize: NSFont.systemFontSize)])
		}
		self.layoutSubtreeIfNeeded()
	}


}
