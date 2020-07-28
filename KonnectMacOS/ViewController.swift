//
//  ViewController.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-27.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
/*
	@IBOutlet weak var contHeader: NSView!
	@IBOutlet weak var contHeaderHeight: NSLayoutConstraint!
	@IBOutlet weak var stackMiddle: NSStackView!
	@IBOutlet weak var collLeft: NSScrollView!
	@IBOutlet weak var collLeftClip: NSClipView!
	@IBOutlet weak var collViewLeft: NSCollectionView!
	@IBOutlet weak var collViewLeftLayout: NSCollectionViewFlowLayout!
	@IBOutlet weak var collLeftMaxWidth: NSLayoutConstraint!
	@IBOutlet weak var collLeftMinWidth: NSLayoutConstraint!
	@IBOutlet weak var collLeftWidth: NSLayoutConstraint!
	@IBOutlet weak var collDiv: NSBox!
	@IBOutlet weak var collRight: NSScrollView!
	@IBOutlet weak var collRightClip: NSClipView!
	@IBOutlet weak var collViewRight: NSCollectionView!
	@IBOutlet weak var collViewRightLayout: NSCollectionViewFlowLayout!
	@IBOutlet weak var contFooter: NSView!
	@IBOutlet weak var contFooterHeight: NSLayoutConstraint!
	*/
	let collViewLeftID = NSUserInterfaceItemIdentifier(rawValue: "collViewLeftID")
	let collViewRightID = NSUserInterfaceItemIdentifier(rawValue: "collViewRightID")
	var LeftList: [LeftItem] = [LeftItem(title: "Abcde"), LeftItem(title: "lolipop"), LeftItem(title: "This")]//[]
	var MainList: [Int] = []
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
		return view
	}()
	let collViewRight: NSCollectionView = {
		let view = NSCollectionView()
		view.isSelectable = true
		view.allowsEmptySelection = true
		view.allowsMultipleSelection = true
		view.enclosingScrollView?.borderType = NSBorderType.noBorder
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
		view.spacing = 8
		return view
	}()
	let header: NSView = {
		let view = NSView()
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.red.cgColor
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
		view.layer?.backgroundColor = NSColor.green.cgColor
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
		return view
	}()
	let mainContent: NSView = {
		let view = NSView()
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.blue.cgColor
		return view
	}()
	let divVert: NSBox = {
		let view = NSBox()
		return view
	}()

	
	override func viewDidLoad() {
		super.viewDidLoad()

//		configCollView()
		drawSubs()
//		addScroll(collectionView: collViewLeft)
//		collViewLeft.delegate = self
//		collViewLeft.dataSource = self
//		drawCollectionView(collectionView: collViewLeft, layout: flowLayout, item: LeftCollViewItem.self, id: collViewLeftID)
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}
	/*
	func configCollView() {
		collViewLeft.delegate = self
		collViewLeft.dataSource = self
		collViewLeft.isSelectable = true
		collViewLeft.allowsEmptySelection = true
		collViewLeft.allowsMultipleSelection = false
		collViewLeft.enclosingScrollView?.borderType = NSBorderType.noBorder
//		let LeftCollItem = NSNib(nibNamed: "LeftCollItem", bundle: nil)
//		let LeftCollItem = NSNib(nibData: LeftCollViewItem.self, bundle: nil)
		collViewLeft.register(LeftCollViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("collViewLeftID"))
		
		collViewRight.delegate = self
		collViewRight.dataSource = self
		collViewRight.isSelectable = true
		collViewRight.allowsEmptySelection = true
		collViewRight.allowsMultipleSelection = true
		collViewRight.enclosingScrollView?.borderType = NSBorderType.noBorder
//		let RightCollItem = NSNib(nibNamed: "RightCollItem", bundle: nil)
		collViewRight.register(RightCollItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("collViewRightID"))
		
		configureFlowLayout()
		//configureGridLayout()
	}
	
	func configureFlowLayout() {
		let flowLayout = NSCollectionViewFlowLayout()
		//collViewLeftLayout.minimumInteritemSpacing = 30.0
		flowLayout.minimumLineSpacing = 0
		flowLayout.sectionInset = NSEdgeInsets(top: 2.0, left: 5.0, bottom: 1.0, right: 5.0)
		flowLayout.itemSize = NSSize(width: collViewLeft.intrinsicContentSize.width, height: 50.0)
		collViewLeft.collectionViewLayout = flowLayout
		
		flowLayout.minimumInteritemSpacing = 30.0
		flowLayout.minimumLineSpacing = 30.0
		flowLayout.sectionInset = NSEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
		//collViewRightLayout.itemSize = NSSize(width: 150.0, height: 150.0)
		collViewRight.collectionViewLayout = flowLayout
	}
	
	func configureGridLayout() {
		let gridLayout = NSCollectionViewGridLayout()
		gridLayout.minimumInteritemSpacing = 30.0
		gridLayout.minimumLineSpacing = 30.0
		gridLayout.maximumNumberOfColumns = 3
		gridLayout.maximumNumberOfRows = 2
		gridLayout.minimumItemSize = NSSize(width: 150.0, height: 150.0)
		gridLayout.maximumItemSize = NSSize(width: 150.0, height: 150.0)
		//collViewLeftLayout = gridLayout
		collViewLeft.collectionViewLayout = gridLayout
	}
*/
	func drawSubs() {
		self.view.wantsLayer = true
		self.view.addSubview(stackVert)
		stackVert.addArrangedSubview(header)
		stackVert.addArrangedSubview(mainContent)
//		mainContent.addSubview(stackHorz)
//		stackHorz.addArrangedSubview(collViewLeft)
//		stackHorz.addArrangedSubview(divVert)
//		stackHorz.addArrangedSubview(collViewRight)
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
	
//	func addScroll(collectionView: NSCollectionView) {
//		let scrollView = NSScrollView()
//		scrollView.documentView = collectionView
//		view.addSubview(scrollView)
//	}
	
//	func drawCollectionView(collectionView: NSCollectionView, layout: NSCollectionViewLayout, item: AnyClass?, id: NSUserInterfaceItemIdentifier) {
//		collectionView.dataSource = self
//		collectionView.delegate = self
//		collectionView.collectionViewLayout = layout
//		collectionView.allowsMultipleSelection = false
//		collectionView.backgroundColors = [.clear]
//		collectionView.isSelectable = true
//		collectionView.register(item, forItemWithIdentifier: id)
//	}


}
