//
//  CollViewDatasource.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-28.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension ViewController: NSCollectionViewDataSource {
	
	func numberOfSections(in collectionView: NSCollectionView) -> Int {
//		let wh = collectionView == collViewLeft ? "left" : "right"
		let num = collectionView == collViewLeft ? LeftList.count : MainList.count
//		print("\(wh) sections: \(num)")
		return num
	}
	
	func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
		let wh = collectionView == collViewLeft ? "left" : "right"
		let num = collectionView == collViewLeft ? LeftList[section].items.count : MainList[section].items.count
		print("\(wh) section: \(section) has \(num) itews")
		return num
	}
	
	func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
		let wh = collectionView == collViewLeft ? "left" : "right"
		if collectionView == collViewLeft {
			let item = LeftList[indexPath.section].items[indexPath.item]
			print("\(wh) item: \(indexPath): \(item.title)")
			let cell = collViewLeft.makeItem(withIdentifier: LeftCollViewItem.id, for: indexPath) as! LeftCollViewItem
			cell.textMiddle.stringValue = item.title
			cell.textLeft.stringValue = item.left
			cell.textRight.stringValue = item.right
			return cell
		} else {
			let item = MainList[indexPath.section].items[indexPath.item]
			print("\(wh) item: \(indexPath): \(item.title)")
			let cell = collViewRight.makeItem(withIdentifier: RightCollItem.id, for: indexPath) as! RightCollItem
			cell.textLabel.stringValue = item.title
			cell.imageMain.image = item.image
			return cell
		}
//		return NSCollectionViewItem()
	}
	
	
	
}
