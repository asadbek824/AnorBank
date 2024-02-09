//
//  CreatLayoutCompositionLayout.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 10/02/24.
//

import UIKit

extension UICollectionViewCompositionalLayout {
    
    static func createLayoutCustom(
        itemWidth: NSCollectionLayoutDimension,
        itemHeight: NSCollectionLayoutDimension,
        itemContentInsert: NSDirectionalEdgeInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0),
        groupWidth: NSCollectionLayoutDimension,
        groupHeight: NSCollectionLayoutDimension,
        groupContentInsert: NSDirectionalEdgeInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    ) -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let section: NSCollectionLayoutSection
            
            let itemSize = NSCollectionLayoutSize(widthDimension: itemWidth, heightDimension: itemHeight)
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: groupWidth, heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = groupContentInsert
            
            section = NSCollectionLayoutSection(group: group)
            
            return section
        }
        return layout
    }
}
