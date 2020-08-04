//
//  NSTableView+Clickable.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-08-04.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//
/*
import Cocoa


//https://stackoverflow.com/questions/18560509/nstableview-detecting-a-mouse-click-together-with-the-row-and-column
extension NSTableView {
	open override func mouseDown(with event: NSEvent) {
		let globalLocation = event.locationInWindow
		let localLocation = self.convert(globalLocation, from: nil)
		let clickedRow = self.row(at: localLocation)
		
		super.mouseDown(with: event)
		
		if (clickedRow != -1) {
			(self.delegate as? NSTableViewClickableDelegate)?.tableView(self, didClickRow: clickedRow)
		}
	}
}


protocol NSTableViewClickableDelegate: NSTableViewDelegate {
	func tableView(_ tableView: NSTableView, didClickRow row: Int)
}
*/
