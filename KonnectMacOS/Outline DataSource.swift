//
//  Outline DataSource.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-01.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//
/*
import Cocoa


extension ViewController: NSOutlineViewDataSource {

	func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
		if item == nil {
			let num = LeftList.count
//			print("numberOfChildren: \(num)")
			return num
		} else {
			if let val = item as? String {
				for sect in 0..<LeftList.count {
					if LeftList[sect].section == val {
						let num = LeftList[sect].items.count
//						print("numberOfChildrenOfItem(\(val)): \(num)")
						return num
					}
				}
			}
		}
		return 0
	}
	
	
	func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
		if item == nil {
			let val = LeftList[index].section
//			outlineView.expandItem(val, expandChildren: true)
//			outlineView.expandItem(val)
//			print("section name: \(val)")
//			outlineView.isItemExpanded(nil) = true
			return val
		} else {
			if let val = item as? String {
				for sect in 0..<LeftList.count {
					if LeftList[sect].section == val {
						let items = LeftList[sect].items[index]
//						print("item in \(val): \(items.title)")
						return items
					}
				}
			}
		}
		return ""
	}
	
	
	func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
		guard let _ = item as? String else { 	return false	 }
		return true
	}
	
//	func outlineView(_ outlineView: NSOutlineView, shouldExpandItem item: Any) -> Bool {
//		return true
//	}


}
*/
