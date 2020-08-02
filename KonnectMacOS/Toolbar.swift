//
//  Toolbar.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-02.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//
/*
import AppKit


class MyWindowController: NSWindowController, NSToolbarDelegate {
	
	var toolbarIdentifier = NSToolbarItem.Identifier("FILE_OPEN")
	
	func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return [NSToolbarItem.Identifier.flexibleSpace, NSToolbarItem.Identifier.print, toolbarIdentifier]
	}
	
	func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return [NSToolbarItem.Identifier.flexibleSpace, NSToolbarItem.Identifier.print, toolbarIdentifier]
	}
	
	func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
				 willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
		if itemIdentifier == toolbarIdentifier {
			let toolbarItem = NSToolbarItem(itemIdentifier: toolbarIdentifier)
			toolbarItem.label = String("File")
			toolbarItem.paletteLabel = String("Open File")
			toolbarItem.toolTip = String("Open file to be handled")
			toolbarItem.isEnabled = true
			toolbarItem.target = self
//			toolbarItem.action = #selector(browseFile)
			toolbarItem.image = NSImage.init(named:NSImage.folderName)
			return toolbarItem
		}
		else {
			return NSToolbarItem(itemIdentifier: itemIdentifier)
		}
	}
	
}
*/


/*
import Cocoa


class WindowController: NSWindowController, NSToolbarDelegate {
	
	// MARK: - Identifiers
	
	let mainToolbarIdentifier = NSToolbar.Identifier("MAIN_TOOLBAR")
	let segmentedControlIdentifier = NSToolbarItem.Identifier("MAIN_TABBAR")
	
	// MARK: - Properties
	
	var tabBar: NSSegmentedControl? = NSSegmentedControl(labels: ["One", "Two"], trackingMode: NSSegmentedControl.SwitchTracking.selectOne, target: self, action: #selector(didSwitchTabs))
	var toolbar: NSToolbar?
	var tabBarController: NSTabViewController?
	
	// MARK: - Life Cycle
	
	override func windowDidLoad() {
		super.windowDidLoad()
		
		self.toolbar = NSToolbar(identifier: mainToolbarIdentifier)
		self.toolbar?.allowsUserCustomization = false
		self.toolbar?.delegate = self
		self.toolbar?.displayMode = .iconOnly
		
		self.tabBar?.setSelected(true, forSegment: 0)
		
		self.tabBarController = self.window?.contentViewController as? NSTabViewController
		self.tabBarController?.tabView.tabViewType = .noTabsNoBorder
		self.tabBarController?.selectedTabViewItemIndex = 0
		
		self.window?.toolbar = self.toolbar
	}
	
	// MARK: - NSToolbarDelegate
	
	public func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
		
		var toolbarItem: NSToolbarItem
		
		switch itemIdentifier {
		case segmentedControlIdentifier:
			toolbarItem = NSToolbarItem(itemIdentifier: segmentedControlIdentifier)
			toolbarItem.view = self.tabBar
		case NSToolbarItem.Identifier.flexibleSpace:
			toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier)
		default:
			fatalError()
		}
		
		return toolbarItem
	}
	
	public func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return [segmentedControlIdentifier, NSToolbarItem.Identifier.flexibleSpace]
	}
	
	public func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
		return [NSToolbarItem.Identifier.flexibleSpace, segmentedControlIdentifier, NSToolbarItem.Identifier.flexibleSpace]
	}
	
	// MARK: - Selectors
	
	@objc func didSwitchTabs(sender: Any) {
		let segmentedControl = sender as! NSSegmentedControl
		self.tabBarController?.selectedTabViewItemIndex = segmentedControl.selectedSegment
	}
	
}
*/
