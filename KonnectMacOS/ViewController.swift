//
//  ViewController.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-27.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	var LeftList: [LeftItem] = [LeftItem(section: "device", items: [LeftSubItem(title: "Abcde"),
																	LeftSubItem(title: "lolipop"),
																	LeftSubItem(title: "This")]),
								LeftItem(section: "remote", items: [LeftSubItem(title: "FTP"),
																	LeftSubItem(title: "my network")])]
	
	var MainList: [RightItem] = [RightItem(section: "all", items: [RightSubItem(image: nil, title: "first"),
																   RightSubItem(image: nil, title: "second"),
																   RightSubItem(image: nil, title: "third"),
																   RightSubItem(image: nil, title: "fourth")])]
	let flowLayout: NSCollectionViewFlowLayout = {
		let view = NSCollectionViewFlowLayout()
		view.minimumLineSpacing = 4

		view.minimumInteritemSpacing = 30.0
		view.minimumLineSpacing = 30.0
		view.sectionInset = NSEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
//		view.itemSize = NSSize(width: collViewLeft.intrinsicContentSize.width, height: 50.0)
		return view
	}()
	let collViewLeft: NSCollectionView = {
		let view = NSCollectionView()
		view.isSelectable = true
		view.allowsEmptySelection = true
		view.allowsMultipleSelection = false
		view.enclosingScrollView?.borderType = NSBorderType.noBorder
		view.backgroundColors = [NSColor.clear]
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let collViewRight: NSCollectionView = {
		let view = NSCollectionView()
		view.isSelectable = true
		view.allowsEmptySelection = true
		view.allowsMultipleSelection = true
		view.enclosingScrollView?.borderType = NSBorderType.noBorder
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let gridLayout: NSCollectionViewGridLayout = {
		let view = NSCollectionViewGridLayout()
		view.minimumInteritemSpacing = 30.0
		view.minimumLineSpacing = 30.0
		view.maximumNumberOfColumns = 3
		view.maximumNumberOfRows = 2
		view.minimumItemSize = NSSize(width: 150.0, height: 150.0)
		view.maximumItemSize = NSSize(width: 150.0, height: 150.0)
		return view
	}()
	let stackVert: NSStackView = {
		let view = NSStackView()
		view.alignment = NSLayoutConstraint.Attribute.leading
		view.distribution = NSStackView.Distribution.fill
		view.orientation = NSUserInterfaceLayoutOrientation.vertical
		view.spacing = 0
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let header: NSView = {
		let view = NSView()
		view.wantsLayer = true
//		view.layer?.backgroundColor = NSColor.red.cgColor
		let gradient = CAGradientLayer()
		gradient.colors = [NSColor.darkGray.cgColor, NSColor.lightGray.cgColor]
		gradient.locations = [0.0, 1.0]
		view.layer = gradient
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var headerHeightConstraint: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		view.constant = 50
		return view
	}()
	let footer: NSView = {
		let view = NSView()
		view.wantsLayer = true
//		view.layer?.backgroundColor = NSColor.green.cgColor
		let gradient = CAGradientLayer()
		gradient.colors = [NSColor.lightGray.cgColor, NSColor.darkGray.cgColor]
		gradient.locations = [0.0, 1.0]
		view.layer = gradient
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var footerHeightConstraint: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		view.constant = 50
		return view
	}()
	let stackHorz: NSStackView = {
		let view = NSStackView()
		view.alignment = NSLayoutConstraint.Attribute.leading
		view.distribution = NSStackView.Distribution.fill
		view.orientation = NSUserInterfaceLayoutOrientation.horizontal
		view.spacing = 8
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let mainContent: NSView = {
		let view = NSView()
		view.wantsLayer = true
//		view.layer?.backgroundColor = NSColor.blue.cgColor
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let divVert: NSBox = {
		let view = NSBox()
		view.titlePosition = NSBox.TitlePosition.noTitle
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let scrollLeft: NSScrollView = {
		let view = NSScrollView()
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.red.cgColor
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let scrollRight: NSScrollView = {
		let view = NSScrollView()
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.green.cgColor
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let clipLeft: NSClipView = {
		let view = NSClipView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let clipRight: NSClipView = {
		let view = NSClipView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var widthLeftConstraint: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		view.constant = 50
		return view
	}()

	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.wantsLayer = true
		headerHeightConstraint.constant = 30
		footerHeightConstraint.constant = 30
		widthLeftConstraint.constant = 300
		drawRows()
		drawMainContent()
		configCollViews()
		configureFlowLayout(collectionView: collViewLeft)
		configureFlowLayout(collectionView: collViewRight)

//		headerHeightConstraint.animator().constant = 20
//		widthLeftConstraint.constant = 500
/*		NSAnimationContext.runAnimationGroup({ (context) in
//			context.allowsImplicitAnimation = true
			context.duration = 3
//			headerHeightConstraint.animator().constant = 20
			widthLeftConstraint.animator().constant = 500
//			self.view.layoutSubtreeIfNeeded()
			self.view.updateConstraintsForSubtreeIfNeeded()
		}) {
//			self.headerHeightConstraint.animator().constant = 50
		}*/
//		widthLeftConstraint.constant = 300
//		stackHorz.layoutSubtreeIfNeeded()
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}
	
	
	func configCollViews() {
		collViewLeft.delegate = self
		collViewLeft.dataSource = self
		collViewLeft.enclosingScrollView?.borderType = NSBorderType.noBorder
		collViewLeft.register(LeftCollViewItem.self, forItemWithIdentifier: LeftCollViewItem.id)
		
		collViewRight.delegate = self
		collViewRight.dataSource = self
		collViewRight.enclosingScrollView?.borderType = NSBorderType.noBorder
		collViewRight.register(RightCollItem.self, forItemWithIdentifier: RightCollItem.id)
		
//		configureFlowLayout()
		//configureGridLayout()
	}
	
	
	func configureFlowLayout(collectionView: NSCollectionView) {
		let flowLayout = NSCollectionViewFlowLayout()
		//collViewLeftLayout.minimumInteritemSpacing = 30.0
		flowLayout.minimumLineSpacing = 0
		flowLayout.sectionInset = NSEdgeInsets(top: 2.0, left: 5.0, bottom: 1.0, right: 5.0)
		flowLayout.itemSize = NSSize(width: collectionView.intrinsicContentSize.width, height: 50.0)
		collectionView.collectionViewLayout = flowLayout
		/*
		flowLayout.minimumInteritemSpacing = 30.0
		flowLayout.minimumLineSpacing = 30.0
		flowLayout.sectionInset = NSEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
		//collViewRightLayout.itemSize = NSSize(width: 150.0, height: 150.0)
		collViewRight.collectionViewLayout = flowLayout*/
	}

	
	func configureGridLayout(collectionView: NSCollectionView) {
		let gridLayout = NSCollectionViewGridLayout()
		gridLayout.minimumInteritemSpacing = 30.0
		gridLayout.minimumLineSpacing = 30.0
		gridLayout.maximumNumberOfColumns = 3
		gridLayout.maximumNumberOfRows = 2
		gridLayout.minimumItemSize = NSSize(width: 150.0, height: 150.0)
		gridLayout.maximumItemSize = NSSize(width: 150.0, height: 150.0)
		//collViewLeftLayout = gridLayout
		collectionView.collectionViewLayout = gridLayout
	}

	
	func drawRows() {
		self.view.addSubview(stackVert)
		stackVert.addArrangedSubview(header)
		stackVert.addArrangedSubview(mainContent)
		stackVert.addArrangedSubview(footer)
		NSLayoutConstraint.activate([
			stackVert.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10),
			stackVert.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
			stackVert.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10),
			stackVert.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
			
			header.topAnchor.constraint(equalTo: stackVert.topAnchor, constant: 0),
			header.leadingAnchor.constraint(equalTo: stackVert.leadingAnchor, constant: 0),
			header.heightAnchor.constraint(equalToConstant: headerHeightConstraint.constant),
			header.trailingAnchor.constraint(equalTo: stackVert.trailingAnchor, constant: 0),

			mainContent.leadingAnchor.constraint(equalTo: stackVert.leadingAnchor, constant: 0),
			mainContent.trailingAnchor.constraint(equalTo: stackVert.trailingAnchor, constant: 0),

			footer.heightAnchor.constraint(equalToConstant: footerHeightConstraint.constant),
			footer.leadingAnchor.constraint(equalTo: stackVert.leadingAnchor, constant: 0),
			footer.bottomAnchor.constraint(equalTo: stackVert.bottomAnchor, constant: 0),
			footer.trailingAnchor.constraint(equalTo: stackVert.trailingAnchor, constant: 0),
			])
	}
	
	
	func drawMainContent() {
		mainContent.addSubview(stackHorz)
		stackHorz.addArrangedSubview(scrollLeft)
		scrollLeft.addSubview(clipLeft)
		clipLeft.addSubview(collViewLeft)
		stackHorz.addArrangedSubview(divVert)
		stackHorz.addArrangedSubview(scrollRight)
		scrollRight.addSubview(clipRight)
		clipRight.addSubview(collViewRight)
		NSLayoutConstraint.activate([
			stackHorz.topAnchor.constraint(equalTo: mainContent.topAnchor, constant: 0),
			stackHorz.leadingAnchor.constraint(equalTo: mainContent.leadingAnchor, constant: 0),
			stackHorz.bottomAnchor.constraint(equalTo: mainContent.bottomAnchor, constant: 0),
			stackHorz.trailingAnchor.constraint(equalTo: mainContent.trailingAnchor, constant: 0),

			scrollLeft.topAnchor.constraint(equalTo: stackHorz.topAnchor, constant: 0),
			scrollLeft.leadingAnchor.constraint(equalTo: stackHorz.leadingAnchor, constant: 0),
			scrollLeft.bottomAnchor.constraint(equalTo: stackHorz.bottomAnchor, constant: 0),
//			scrollLeft.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
//			scrollLeft.widthAnchor.constraint(lessThanOrEqualToConstant: 500),
			scrollLeft.widthAnchor.constraint(equalToConstant: widthLeftConstraint.constant),

			clipLeft.topAnchor.constraint(equalTo: scrollLeft.topAnchor, constant: 0),
			clipLeft.leadingAnchor.constraint(equalTo: scrollLeft.leadingAnchor, constant: 0),
			clipLeft.bottomAnchor.constraint(equalTo: scrollLeft.bottomAnchor, constant: 0),
			clipLeft.trailingAnchor.constraint(equalTo: scrollLeft.trailingAnchor, constant: 0),
			
			collViewLeft.topAnchor.constraint(equalTo: clipLeft.topAnchor, constant: 0),
			collViewLeft.leadingAnchor.constraint(equalTo: clipLeft.leadingAnchor, constant: 0),
			collViewLeft.bottomAnchor.constraint(equalTo: clipLeft.bottomAnchor, constant: 0),
			collViewLeft.trailingAnchor.constraint(equalTo: clipLeft.trailingAnchor, constant: 0),

			divVert.topAnchor.constraint(equalTo: stackHorz.topAnchor, constant: 10),
			divVert.widthAnchor.constraint(equalToConstant: 1),
			divVert.bottomAnchor.constraint(equalTo: stackHorz.bottomAnchor, constant: -10),

			scrollRight.topAnchor.constraint(equalTo: stackHorz.topAnchor, constant: 0),
			scrollRight.bottomAnchor.constraint(equalTo: stackHorz.bottomAnchor, constant: 0),
			scrollRight.trailingAnchor.constraint(equalTo: stackHorz.trailingAnchor, constant: 0),

			clipRight.topAnchor.constraint(equalTo: scrollRight.topAnchor, constant: 0),
			clipRight.leadingAnchor.constraint(equalTo: scrollRight.leadingAnchor, constant: 0),
			clipRight.bottomAnchor.constraint(equalTo: scrollRight.bottomAnchor, constant: 0),
			clipRight.trailingAnchor.constraint(equalTo: scrollRight.trailingAnchor, constant: 0),
			
			collViewRight.topAnchor.constraint(equalTo: clipRight.topAnchor, constant: 0),
			collViewRight.leadingAnchor.constraint(equalTo: clipRight.leadingAnchor, constant: 0),
			collViewRight.bottomAnchor.constraint(equalTo: clipRight.bottomAnchor, constant: 0),
			collViewRight.trailingAnchor.constraint(equalTo: clipRight.trailingAnchor, constant: 0),
			])
	}


}
