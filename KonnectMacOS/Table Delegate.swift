//
//  Table Delegate.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-03.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension ViewController: NSTableViewDelegate {
	
	func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
		let item = menuItems[row]
		let view = TableRow()
		view.setItem(item: item)
		return view
	}
	/*
	func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
		let seld = tableView.selectedRow	//-1
		let clid = tableView.clickedRow
		if clid > -1 && clid < tableView.numberOfRows {
			return (menuItems[clid].isGroup) ? false : true
		} else {
			return true
		}
	}
	*/
	func tableView(_ tableView: NSTableView, selectionIndexesForProposedSelection proposedSelectionIndexes: IndexSet) -> IndexSet {
//		if tableView.selectedRow == -1 && tableView.clickedRow == -1 {
//			return IndexSet(integer: -1)
//		}
//		let seld = tableView.selectedRow	//-1
//		print("selected \(seld)")
//		let clid = tableView.clickedRow
		var test = proposedSelectionIndexes.first ?? -1
		var out = IndexSet(integer: -1)
//		if test > -1 && test < tableView.numberOfRows {
//			return (menuItems[test].isGroup) ? IndexSet(integer: test+1) : IndexSet(integer: test)
//			out = (menuItems[test].isGroup) ? IndexSet(integer: test+1) : IndexSet(integer: test)
//			if menuItems[test].isGroup {
				while test < 0 || /*test > tableView.numberOfRows-1 ||*/ menuItems[test].isGroup {
					test += 1
				}
//			}// else {
				out = IndexSet(integer: test)
//			}
//		} else {
//			print("test is out of range")
//			return IndexSet(integer: -1)
//		}
		if let f = out.first/*, let val = proposedSelectionIndexes.first*/ {/*
			if val != test {*/
				print("row \(f), sel \(tableView.selectedRow), cli \(tableView.clickedRow)")
			/*}*/
		}
		return out
	}
	/*
	func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
		let item = menuItems[row]
//		if let id = tableColumn?.identifier {
//			guard let cell = tableView.makeView(withIdentifier: id, owner: self) as? NSTableCellView else {
//				print("cannot make view for table (\(id.rawValue)) at row \(row)")
//				return nil
//			}
//			cell.textField?.stringValue = item.title
//			return cell
//		} else {
//			return NSTextField(labelWithString: item.title)
//		}
		let view = tableView.makeView(withIdentifier: col1, owner: self)
		print(view)
		return nil
	}*/
/*
	func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
		let cellView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CellView"), owner: self) as! NSTableCellView
		
		if let dataSource = tableView.dataSource as? NSTableViewSectionDataSource {
			let (section, sectionRow) = dataSource.tableView(tableView, sectionForRow: row)
			
			// here! build view for given section and row index
		}
		
		return cellView
	}
*//*
	func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
		/*
		let cellView = tableView.makeView(withIdentifier: col1, owner: self) as! NSTableCellView
		
//		var view: TableRow?
		if let dataSource = tableView.dataSource as? NSTableViewSectionDataSource {
			let (section, sectionRow) = dataSource.tableView(tableView: tableView, sectionForRow: row)
//			switch tableColumn?.identifier {
//			case col1/*NSUserInterfaceItemIdentifier("tableCol1")*/:
		*/
			if tableColumn?.identifier == col1 {
				let view = TableRow()
				view.left = menuItems[row].left ?? "L"
				view.right = menuItems[row].right ?? "R"
				view.farRight = menuItems[row].far ?? "OK"
				//			view.center = (item as? LeftSubItem)?.title ?? item as! String//LeftList[0].items[row].title
//				view.center = LeftList[section].items[sectionRow].title
				view.center = menuItems[row].title
				view.inset = menuItems[row].margin//NSEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
				view.gapLeftCenter = menuItems[row].gapLeftTitle//5
				view.gapCenterRight = menuItems[row].gapTitleRight//20
//				return view
//				cellView.addSubview(view)
//			default:
//				view = nil
			}
		return view/*
		}
		return cellView//nil
		*/
	}*/


}

