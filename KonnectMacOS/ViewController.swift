//
//  ViewController.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-27.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa
//import AwesomeEnum
import CocoaFontAwesome


class ViewController: NSViewController {

	static var iconSize = CGSize(width: 28, height: 28)
	lazy var menuItems: [MenuItem] = [
		MenuItem(left: nil,
				 leftImg: nil,//Awesome.Brand.android.asImage(size: CGSize(width: 40, height: 40), color: .red, backgroundColor: .blue),
				 right: nil,
				 rightImg: nil,
				 title: NSAttributedString(string: "DEVICE"),
				 far: nil,
				 farImg: NSImage.fontAwesomeIcon(name: FontAwesome.check, style: FontAwesomeStyle.solid, textColor: NSColor.orange, size: ViewController.iconSize),//nil,
//				 margin: NSEdgeInsets(top: 5, left: 0, bottom: 1, right: 0),
//				 gapLeftTitle: 50,
//				 gapTitleRight: 1,
				 isGroup: true),
		MenuItem(left: nil,//Awesome.Regular.envelopeOpen.asAttributedText(fontSize: 17, color: .red, backgroundColor: .blue),
				 leftImg: NSImage.fontAwesomeIcon(name: FontAwesome.images, style: FontAwesomeStyle.solid, textColor: NSColor.red, size: ViewController.iconSize),//nil,
				 right: nil,
				 rightImg: nil,
				 title: NSAttributedString(string: "Photos"),
				 far: nil,
				 farImg: NSImage.fontAwesomeIcon(name: FontAwesome.check, style: FontAwesomeStyle.solid, textColor: NSColor.orange, size: ViewController.iconSize),//nil,
//				 gapLeftTitle: 50,
				 isGroup: false),
		MenuItem(left: NSAttributedString(string: String.fontAwesomeIcon(name: FontAwesome.music), attributes: [NSAttributedString.Key.foregroundColor : NSColor.blue, NSAttributedString.Key.font : NSFont.fontAwesome(ofSize: 15, style: FontAwesomeStyle.regular)]),//nil,
				 leftImg: NSImage.fontAwesomeIcon(name: FontAwesome.music, style: FontAwesomeStyle.solid, textColor: NSColor.brown, size: ViewController.iconSize),//nil,
				 right: nil,
				 rightImg: nil,
				 title: NSAttributedString(string: "Music"),
				 far: nil,
				 farImg: nil,
				 isGroup: false),
		MenuItem(left: nil,
				 leftImg: NSImage.fontAwesomeIcon(name: FontAwesome.file, style: FontAwesomeStyle.solid, textColor: NSColor.blue, size: ViewController.iconSize),//nil,
				 right: nil,
				 rightImg: nil,
				 title: NSAttributedString(string: "Files"),
				 far: nil,
				 farImg: nil,
				 isGroup: false),
		MenuItem(left: nil,
				 leftImg: nil,
				 right: nil,
				 rightImg: nil,
				 title: NSAttributedString(string: "REMOTE"),
				 far: nil,
				 farImg: nil,
				 isGroup: true),
		MenuItem(left: nil,
				 leftImg: NSImage.fontAwesomeIcon(name: FontAwesome.upload, style: FontAwesomeStyle.solid, textColor: NSColor.orange, size: ViewController.iconSize),//nil,
				 right: nil,
				 rightImg: nil,
				 title: NSAttributedString(string: "my FTP"),
				 far: nil,
				 farImg: nil,
				 isGroup: false),
		MenuItem(left: nil,
				 leftImg: NSImage.fontAwesomeIcon(name: FontAwesome.sitemap, style: FontAwesomeStyle.solid, textColor: NSColor.purple, size: ViewController.iconSize),//nil,
				 right: nil,
				 rightImg: nil,
				 title: NSAttributedString(string: "my network"),
				 far: nil,
				 farImg: nil,
				 isGroup: false)
	]
	
	var MainList: [RightItem] = [RightItem(section: "all", items: [RightSubItem(image: nil, title: "first"),
																   RightSubItem(image: nil, title: "second"),
																   RightSubItem(image: nil, title: "third"),
																   RightSubItem(image: nil, title: "fourth")])]
/*	let flowLayout: NSCollectionViewFlowLayout = {
		let view = NSCollectionViewFlowLayout()
		view.minimumLineSpacing = 4

		view.minimumInteritemSpacing = 30.0
		view.minimumLineSpacing = 30.0
		view.sectionInset = NSEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
//		view.itemSize = NSSize(width: collViewLeft.intrinsicContentSize.width, height: 50.0)
		return view
	}()*/
	let collViewRight = NSCollectionView()
/*	let collViewRight: NSCollectionView = {
		let view = NSCollectionView()
		view.isSelectable = true
		view.allowsEmptySelection = true
		view.allowsMultipleSelection = true
		view.enclosingScrollView?.borderType = NSBorderType.noBorder
		view.backgroundColors = [NSColor.clear]
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()*/
/*	let gridLayout: NSCollectionViewGridLayout = {
		let view = NSCollectionViewGridLayout()
		view.minimumInteritemSpacing = 30.0
		view.minimumLineSpacing = 30.0
		view.maximumNumberOfColumns = 3
		view.maximumNumberOfRows = 2
		view.minimumItemSize = NSSize(width: 150.0, height: 150.0)
		view.maximumItemSize = NSSize(width: 150.0, height: 150.0)
		return view
	}()*/
	let stackVert: NSStackView = {
		let view = NSStackView()
		view.alignment = NSLayoutConstraint.Attribute.leading
		view.distribution = NSStackView.Distribution.fill
		view.orientation = NSUserInterfaceLayoutOrientation.vertical
		view.spacing = 0
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
//	let header: NSView = {
//		let view = NSView()
//		view.wantsLayer = true
////		view.layer?.backgroundColor = NSColor.red.cgColor
//		let gradient = CAGradientLayer()
//		gradient.colors = [NSColor.darkGray.cgColor, NSColor.lightGray.cgColor]
//		gradient.locations = [0.0, 1.0]
//		view.layer = gradient
//		view.translatesAutoresizingMaskIntoConstraints = false
//		return view
//	}()
//	var headerHeightConstraint: NSLayoutConstraint = {
//		let view = NSLayoutConstraint()
//		view.constant = 50
//		return view
//	}()
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
		view.spacing = 0
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let mainContent: NSView = {
		let view = NSView()
		view.wantsLayer = true
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let divVert: NSBox = {
		let view = NSBox()
		view.titlePosition = NSBox.TitlePosition.noTitle
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var gapDivVertTop: CGFloat = 10
	var gapDivVertBottom: CGFloat = 10
	var widthDivVert: CGFloat = 1
	let scrollLeft: NSScrollView = {
		let view = NSScrollView()
		view.wantsLayer = true
		view.drawsBackground = false
		view.backgroundColor = NSColor.clear
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let drawer: NSView = {
		let view = NSView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var aboveScrollLeft: CGFloat = 5
	var belowScrollLeft: CGFloat = 5
	var leftScrollLeft: CGFloat = 5
	let clipLeft: NSClipView = {
		let view = NSClipView()
		return view
	}()
	let scrollRight: NSScrollView = {
		let view = NSScrollView()
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.green.cgColor
		view.drawsBackground = true
		view.backgroundColor = NSColor.white
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	var widthLeftConstraint: NSLayoutConstraint = {
		let view = NSLayoutConstraint()
		return view
	}()
	let maxWidthLeftTable: CGFloat = 250
	let minWidthLeftTable: CGFloat = 50
	var drawerIsOpen = true
//	var drawerIsOpen = false
	var tableLeft: NSTableView = {
		let view = NSTableView()
		view.rowHeight = 35
		view.floatsGroupRows = false
		view.wantsLayer = true
		view.focusRingType = NSFocusRingType.none
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let col1 = NSUserInterfaceItemIdentifier("tableCol1")
	var outerMargins = NSEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
	let headBar: NSToolbar = {
		let view = NSToolbar()
		return view
	}()
	static var shared: ViewController?

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		ViewController.shared = self
		self.view.setFrameSize(NSSize(width: 800, height: 600))
		self.view.setAccessibilityTitle("Konnect - MacOS")

		self.view.wantsLayer = true
//		headerHeightConstraint.constant = 30
		footerHeightConstraint.constant = 30
		widthLeftConstraint.constant = maxWidthLeftTable
		drawRows()
		drawMainContent()
/*		configCollView()
		let layout = NSCollectionViewFlowLayout()
		layout.minimumLineSpacing = 4
		collViewRight.collectionViewLayout = layout//NSCollectionViewFlowLayout()
//		configureFlowLayout(collectionView: collViewRight)
//		configureGridLayout(collectionView: collViewRight)
*/
		drawTable()
		mainContent.bringSubviewToFront(stackHorz)
	}
	
	
	override func viewWillAppear() {
		super.viewWillAppear()
		drawer.wantsLayer = true
		drawer.layer?.backgroundColor = NSColor.clear.cgColor
		drawer.layer?.isOpaque = false
		self.view.window?.title = "Konnect - macOS"
	}
	
	
	@objc func toggleDrawer() {
		self.drawerIsOpen = !drawerIsOpen
//		print("drawer is now \(drawerIsOpen ? "open" : "closed") - \(widthLeftConstraint)")
		NSAnimationContext.runAnimationGroup({ (context) in
			context.duration = 0.4
			widthLeftConstraint.animator().constant = drawerIsOpen ? maxWidthLeftTable : minWidthLeftTable
		}) {
		}
	}
	

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}
	
	
	func configCollView() {
		collViewRight.translatesAutoresizingMaskIntoConstraints = false
		collViewRight.isSelectable = true
		collViewRight.allowsEmptySelection = true
		collViewRight.allowsMultipleSelection = false
		collViewRight.enclosingScrollView?.borderType = NSBorderType.noBorder
		collViewRight.backgroundColors = [NSColor.clear]
		collViewRight.delegate = self
		collViewRight.dataSource = self
		collViewRight.enclosingScrollView?.borderType = NSBorderType.noBorder
		collViewRight.register(RightCollItem.self, forItemWithIdentifier: RightCollItem.id)
		
//		configureFlowLayout()
		//configureGridLayout()
	}
	
	
	func configureFlowLayout(collectionView: NSCollectionView) {
		let flowLayout = NSCollectionViewFlowLayout()
/*		flowLayout.minimumLineSpacing = 0
		flowLayout.sectionInset = NSEdgeInsets(top: 2.0, left: 5.0, bottom: 1.0, right: 5.0)
		flowLayout.itemSize = NSSize(width: collectionView.intrinsicContentSize.width, height: 50.0)*/
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
//		stackVert.addArrangedSubview(header)
		stackVert.addArrangedSubview(mainContent)
		stackVert.addArrangedSubview(footer)
//		header.addSubview(headBar)
		NSLayoutConstraint.activate([
			stackVert.topAnchor.constraint(equalTo: self.view.topAnchor, constant: outerMargins.top),
			stackVert.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: outerMargins.left),
			stackVert.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -outerMargins.bottom),
			stackVert.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -outerMargins.right),
			
//			header.topAnchor.constraint(equalTo: stackVert.topAnchor, constant: 0),
//			header.leadingAnchor.constraint(equalTo: stackVert.leadingAnchor, constant: 0),
//			header.heightAnchor.constraint(equalToConstant: headerHeightConstraint.constant),
//			header.trailingAnchor.constraint(equalTo: stackVert.trailingAnchor, constant: 0),

//			headBar.topAnchor.constraint(equalTo: stackVert.topAnchor, constant: 0),
//			headBar.leadingAnchor.constraint(equalTo: stackVert.leadingAnchor, constant: 0),
//			headBar.heightAnchor.constraint(equalToConstant: headerHeightConstraint.constant),
//			headBar.trailingAnchor.constraint(equalTo: stackVert.trailingAnchor, constant: 0),
			
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
/*		scrollLeft.documentView = clipLeft
		clipLeft.documentView = tableLeft	*/
///**/		scrollLeft.documentView = tableLeft	/**/
		mainContent.addSubview(scrollLeft)
		scrollLeft.addSubview(tableLeft)////////
		stackHorz.addArrangedSubview(drawer)
//		stackHorz.addArrangedSubview(scrollLeft)
//		scrollLeft.addSubview(clipLeft)
//		clipLeft.addSubview(tableLeft)
		stackHorz.addArrangedSubview(divVert)
//		scrollRight.documentView = collViewRight
		stackHorz.addArrangedSubview(scrollRight)
//		scrollRight.addSubview(collViewRight)
		widthLeftConstraint = drawer.widthAnchor.constraint(equalToConstant: leftScrollLeft + widthLeftConstraint.constant)
		widthLeftConstraint.isActive = true
		NSLayoutConstraint.activate([
			stackHorz.topAnchor.constraint(equalTo: mainContent.topAnchor, constant: 0),
			stackHorz.leadingAnchor.constraint(equalTo: mainContent.leadingAnchor, constant: 0),
			stackHorz.bottomAnchor.constraint(equalTo: mainContent.bottomAnchor, constant: 0),
			stackHorz.trailingAnchor.constraint(equalTo: mainContent.trailingAnchor, constant: 0),

			scrollLeft.topAnchor.constraint(equalTo: mainContent.topAnchor, constant: aboveScrollLeft),
			scrollLeft.leadingAnchor.constraint(equalTo: mainContent.leadingAnchor, constant: leftScrollLeft),
			scrollLeft.bottomAnchor.constraint(equalTo: mainContent.bottomAnchor, constant: -belowScrollLeft),
			scrollLeft.widthAnchor.constraint(equalToConstant: widthLeftConstraint.constant),

			drawer.topAnchor.constraint(equalTo: stackHorz.topAnchor, constant: aboveScrollLeft),
			drawer.leadingAnchor.constraint(equalTo: stackHorz.leadingAnchor, constant: 0),
			drawer.bottomAnchor.constraint(equalTo: stackHorz.bottomAnchor, constant: -belowScrollLeft),
/*
			clipLeft.topAnchor.constraint(equalTo: scrollLeft.topAnchor, constant: 0),
			clipLeft.leadingAnchor.constraint(equalTo: scrollLeft.leadingAnchor, constant: 0),
			clipLeft.bottomAnchor.constraint(equalTo: scrollLeft.bottomAnchor, constant: 0),
//			clipLeft.widthAnchor.constraint(equalToConstant: widthLeftConstraint.constant),
			clipLeft.trailingAnchor.constraint(equalTo: scrollLeft.trailingAnchor, constant: 0),

			tableLeft.topAnchor.constraint(equalTo: clipLeft.topAnchor, constant: 0),
			tableLeft.leadingAnchor.constraint(equalTo: clipLeft.leadingAnchor, constant: 0),
			tableLeft.trailingAnchor.constraint(equalTo: clipLeft.trailingAnchor, constant: 0),
			tableLeft.bottomAnchor.constraint(equalTo: clipLeft.bottomAnchor, constant: 0),
*/
			tableLeft.topAnchor.constraint(equalTo: scrollLeft.topAnchor, constant: 0),
			tableLeft.leadingAnchor.constraint(equalTo: scrollLeft.leadingAnchor, constant: 0),
			tableLeft.trailingAnchor.constraint(equalTo: scrollLeft.trailingAnchor, constant: 0),
/**/
			divVert.topAnchor.constraint(equalTo: stackHorz.topAnchor, constant: gapDivVertTop),
			divVert.widthAnchor.constraint(equalToConstant: widthDivVert),
			divVert.bottomAnchor.constraint(equalTo: stackHorz.bottomAnchor, constant: -gapDivVertBottom),

			scrollRight.topAnchor.constraint(equalTo: stackHorz.topAnchor, constant: 0),
			scrollRight.bottomAnchor.constraint(equalTo: stackHorz.bottomAnchor, constant: 0),
			scrollRight.trailingAnchor.constraint(equalTo: stackHorz.trailingAnchor, constant: 0),
/*
			collViewRight.topAnchor.constraint(equalTo: scrollRight.topAnchor, constant: 0),
			collViewRight.leadingAnchor.constraint(equalTo: scrollRight.leadingAnchor, constant: 0),
			collViewRight.bottomAnchor.constraint(equalTo: scrollRight.bottomAnchor, constant: 0),
			collViewRight.trailingAnchor.constraint(equalTo: scrollRight.trailingAnchor, constant: 0),
*/
			])
	}
	
	
	func drawTable() {
		let col = NSTableColumn(identifier: col1)
		col.maxWidth = 256
		col.isEditable = false
		tableLeft.addTableColumn(col)
		tableLeft.dataSource = self
		tableLeft.delegate = self
//		tableLeft.action = #selector(onItemClicked)
//		let offset = tableLeft.frame.height - window.contentLayoutRect.maxY
//		scrollLeft.contentInsets.top = offset
	}


}
