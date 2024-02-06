//
//  SegmentNotificationViewPresenter.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 02/02/24.
//

import UIKit

protocol SegmentNotificationViewPresenterable: AnyObject {
    func numberOfItemsInSection(in section: Int) -> Int
    func cellForItemAt(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
}

final class SegmentNotificationViewPresenter: SegmentNotificationViewPresenterable {
    
    func numberOfItemsInSection(in section: Int) -> Int {
        10
    }
    
    func cellForItemAt(collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .cyan
        
        return cell
    }
}
