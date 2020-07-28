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
		return 1//collectionView == collViewLeft ? 1 : MainList.count
	}
	
	func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
		return LeftList.count//collectionView == collViewLeft ? LeftList.count : MainList[section]
	}
	
	func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
		if collectionView == collViewLeft {
			let item = LeftList[indexPath.item]
			let cellView = collViewLeft.makeItem(withIdentifier: collViewLeftID, for: indexPath) as! LeftCollViewItem
			cellView.textMiddle.stringValue = item.title
			cellView.textLeft.stringValue = item.left
			cellView.textRight.stringValue = item.right
			return cellView
		} /*else {
			let item = MainList[indexPath.item]
			let cellView = collViewRight.makeItem(withIdentifier: collViewRightID, for: indexPath) as! RightCollItem
			cellView.textLabel.stringValue = item.description
			return cellView
		}*/
		return NSCollectionViewItem()
	}
	
	
	
}
