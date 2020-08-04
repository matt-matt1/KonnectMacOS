//
//  NSTableViewSectionDataSource.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-03.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


//protocol NSTableViewSectionDataSource: NSTableViewDataSource {
//	func numberOfSectionsInTableView(tableView: NSTableView) -> Int
//	func tableView(tableView: NSTableView, numberOfRowsInSection section: Int) -> Int
//	func tableView(tableView: NSTableView, sectionForRow row: Int) -> (section: Int, row: Int)
//}
//class NSTableViewSectionDataSource: NSTableViewDataSource {
//
//}
extension ViewController: NSTableViewDataSource {
	
	func numberOfRows(in tableView: NSTableView) -> Int {
		return menuItems.count
	}
	
	
	func tableView(_ tableView: NSTableView, isGroupRow row: Int) -> Bool {
		return menuItems[row].isGroup
	}

	/*
	func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
		let item = menuItems[row]
//		if let cell = tableView.makeView(withIdentifier: tableColumn?.identifier ?? NSUserInterfaceItemIdentifier(rawValue: ""), owner: self) as? TableRow {
//			cell.setItem(item: item)
//			return cell
//		}
//		if tableColumn?.identifier == col1 {
		print("row \(row)")
		let view = tableView.makeView(withIdentifier: col1, owner: self)
//		let view2 = tableView.makeView(withIdentifier: col1, owner: self) as? NSTableCellView
		if let id = tableColumn?.identifier {
//			print("id is \(id)")
			if let cell = tableView.makeView(withIdentifier: id, owner: self) as? NSTableCellView {
				print("cell is \(cell)")
			} else {
				print("view is \(view)")
			}
		} else {
			//return group name in some view
			return NSTextField(labelWithString: item.title)
		}
		if let cellView = tableView.makeView(withIdentifier: col1, owner: self) as? TableRow {
			cellView.setItem(item: item)
			return cellView
		}
		return NSTextField(labelWithString: item.title)
	}*/
/*
	func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
		let item = menuItems[row]
		let view = TableRow()
		view.setItem(item: item)
		return view
	}*/
	/*
	func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
		let item = menuItems[row]
		print("row \(row)")
		if let id = tableColumn?.identifier {
			print("id \(id.rawValue)")
			let view = tableView.makeView(withIdentifier: id, owner: self)
			print("view \(view)")
		}
//		print(item.title)
//		if item.isGroup {
//			print("is a group")
//		} else {
//			print("not a group")
//		let row = TableRow()
//		row.setItem(item: item)
//		row.center = item.title
//		row.left = item.left ?? ""
//		row.right = item.right ?? ""
//		row.farRight = item.far ?? ""
//		if row.gapCenterRight > 0 {
//			row.gapCenterRight = item.gapTitleRight
//		}
//		if row.gapLeftCenter > 0 {
//			row.gapLeftCenter = item.gapLeftTitle
//		}
//		if row.inset.top > 0 || row.inset.left > 0 || row.inset.bottom > 0 || row.inset.right > 0 {
//			row.inset = item.margin
//		}
//		}
		return item.title//nil//row
	}
*/
	//	func numberOfRows(in tableView: NSTableView) -> Int {
	//		var counts: Int = 0
	//		if let dataSource = tableView.dataSource as? NSTableViewSectionDataSource {
	//			let numberOfSections = dataSource.numberOfSectionsInTableView(tableView: tableView)
	//			for sect in 0..<numberOfSections {
	//				counts += LeftList[sect].items.count
	//			}
	//		}
	//		return counts
	//	}
	
	//	func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
	//		if let dataSource = tableView.dataSource as? NSTableViewSectionDataSource {
	//			let numberOfSections = dataSource.numberOfSectionsInTableView(tableView: tableView)
	//
	//			var counts = [Int](repeating: 0, count: numberOfSections)
	//			for sect in 0..<numberOfSections {
	//				counts.append(LeftList[sect].items.count)
	//			}
	//			let result = self.sectionForRow(row: row, counts: counts)
	//			return (section: result.section ?? 0, row: result.row ?? 0)
	//		}
	//		assertionFailure("Invalid datasource")
	//		return (section: 0, row: 0)
	//	}
	

}

/*
extension ViewController: NSTableViewSectionDataSource {
	func numberOfSectionsInTableView(tableView: NSTableView) -> Int {
		return LeftList.count
	}
	
	
	func tableView(tableView: NSTableView, numberOfRowsInSection section: Int) -> Int {
		return LeftList[section].items.count
	}
	
	
	func tableView(tableView: NSTableView, sectionForRow row: Int) -> (section: Int, row: Int) {
		if let dataSource = tableView.dataSource as? NSTableViewSectionDataSource {
			let numberOfSections = dataSource.numberOfSectionsInTableView(tableView: tableView)
//			var counts: [Int] = []
			var counts = [Int](repeating: 0, count: numberOfSections)
			for sect in 0..<numberOfSections {
				counts.append(LeftList[sect].items.count)
//				counts[section] = dataSource.tableView(tableView, numberOfRowsInSection: section)
			}
			let result = self.sectionForRow(row: row, counts: counts)
			return (section: result.section ?? 0, row: result.row ?? 0)
		}
		assertionFailure("Invalid datasource")
		return (section: 0, row: 0)
//		return sectionForRow(row: row, counts: counts) as! (section: Int, row: Int)
	}
	
	
	private func sectionForRow(row: Int, counts: [Int]) -> (section: Int?, row: Int?) {
		var c = counts[0]
		for section in 0..<counts.count {
			if (section > 0) {
				c = c + counts[section]
			}
			if (row >= c - counts[section]) && row < c {
				return (section: section, row: row - (c - counts[section]))
			}
		}
		return (section: nil, row: nil)
	}


}
*/
