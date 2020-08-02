//
//  Dele.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-01.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension ViewController: NSOutlineViewDelegate {
	
	func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
//		guard let colIdentifier = tableColumn?.identifier else { return nil }
//		if colIdentifier == NSUserInterfaceItemIdentifier(rawValue: "col1") {
//
//		} else {
//
//		}
		switch tableColumn?.identifier {
		case col1/*NSUserInterfaceItemIdentifier("tableCol1")*/:
			let view = TableRow()
			view.left = "L"
			view.right = "R"
			view.farRight = "OK"
			view.center = (item as? LeftSubItem)?.title ?? item as! String//LeftList[0].items[row].title
			view.inset = NSEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
			view.gapLeftCenter = 5
			view.gapCenterRight = 20
			return view
		default:
			return nil
		}
	}
	
	
	@objc func onItemClicked() {
		/*
		for row in 0..<LeftList.count {
			if let view = tableLeft.view(atColumn: tableLeft.clickedColumn, row: row, makeIfNecessary: false) as? TableRow {
				view.highlighted = false
			}
		}
		if let view = tableLeft.view(atColumn: tableLeft.clickedColumn, row: tableLeft.clickedRow, makeIfNecessary: false) as? TableRow {
			view.highlighted = true
		}*/
		let item = tableLeft.item(atRow: tableLeft.clickedRow)
		let title = (item as? LeftSubItem)?.title ?? item as! String
//		print("row \(tableLeft.clickedRow), col \(tableLeft.clickedColumn) clicked, title: \(title)")
		print("selected: \(title)")
	}


}
