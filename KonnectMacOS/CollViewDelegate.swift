//
//  CollViewDelegate.swift
//  KonnectMacOS
//
//  Created by Yuma Technical Inc. on 2020-07-28.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension ViewController: NSCollectionViewDelegate {
	
	func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
		guard let indexPath = indexPaths.first else { return }
		if collectionView == collViewLeft {
			let item = LeftList[indexPath.section].items[indexPath.item]
			print("selected left \(item.title)")
		} else {
			let item = MainList[indexPath.section].items[indexPath.item]
			print("selected right \(item.title)")
		}
	}
	
	func collectionView(_ collectionView: NSCollectionView, didDeselectItemsAt indexPaths: Set<IndexPath>) {
		guard let indexPath = indexPaths.first else { return }
		if collectionView == collViewLeft {
			let item = LeftList[indexPath.section].items[indexPath.item]
			print("deselected left \(item.title)")
		} else {
			let item = MainList[indexPath.section].items[indexPath.item]
			print("deselected right \(item.title)")
		}
	}
	
	func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
		if collectionView == collViewLeft {
			return NSSize(width: collectionView.intrinsicContentSize.width, height: 50)
		} else {
			return NSSize(width: 150.0, height: 150.0)
		}
	}

}
